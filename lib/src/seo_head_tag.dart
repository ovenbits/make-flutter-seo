// 🎯 Dart imports:
import 'dart:convert';

// 🌎 Project imports:
import 'package:make_flutter_seo/src/seo_tag.dart';

abstract class SeoHeadTag {
  const SeoHeadTag();

  String encode();

  static SeoHeadTag decode(String jsonString) {
    try {
      final Map<String, dynamic> json = jsonDecode(jsonString);
      final String? type = json['type'];
      final Map<String, dynamic>? properties = json['properties'];

      if (properties == null) {
        throw FormatException('Missing properties in JSON');
      }

      switch (type) {
        case 'MetaTag':
          return SeoMetaTag(name: properties['name'], httpEquiv: properties['httpEquiv'], content: properties['content']);
        case 'LinkTag':
          return SeoLinkTag(
            title: properties['title'],
            rel: properties['rel'],
            type: properties['type'],
            hreflang: properties['hreflang'],
            href: properties['href'],
            media: properties['media'],
          );
        default:
          throw FormatException('Unknown HeadTag type: $type');
      }
    } catch (e) {
      throw FormatException('Failed to decode HeadTag: $e');
    }
  }
}

class SeoMetaTag extends SeoHeadTag {
  final String? name;
  final String? httpEquiv;
  final String? content;

  const SeoMetaTag({this.name, this.httpEquiv, this.content});

  @override
  String encode() {
    final Map<String, dynamic> json = {'type': 'MetaTag', 'properties': <String, dynamic>{}};

    // Only include non-null properties for cleaner output
    if (name != null) json['properties']['name'] = name;
    if (httpEquiv != null) json['properties']['httpEquiv'] = httpEquiv;
    if (content != null) json['properties']['content'] = content;

    return jsonEncode(json);
  }
}

class SeoLinkTag extends SeoHeadTag {
  final String? title;
  final String? rel;
  final String? type;
  final String? hreflang;
  final String? href;
  final String? media;

  const SeoLinkTag({this.title, this.rel, this.type, this.hreflang, this.href, this.media});

  @override
  String encode() {
    final Map<String, dynamic> json = {'type': 'LinkTag', 'properties': <String, dynamic>{}};

    // Only include non-null properties for cleaner output
    if (title != null) json['properties']['title'] = title;
    if (rel != null) json['properties']['rel'] = rel;
    if (type != null) json['properties']['type'] = type;
    if (hreflang != null) json['properties']['hreflang'] = hreflang;
    if (href != null) json['properties']['href'] = href;
    if (media != null) json['properties']['media'] = media;

    return jsonEncode(json);
  }
}

class HeadTags extends SeoTag {
  final List<SeoHeadTag> tags;

  const HeadTags({required this.tags});
}
