part of 'seo_tag.dart';

extension type const SeoHeadTagType(String _) implements String {
  static const SeoHeadTagType meta = SeoHeadTagType('meta');
  static const SeoHeadTagType link = SeoHeadTagType('link');
}

sealed class SeoHeadTag implements SeoTag {
  SeoHeadTagType get tagType;

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
        case SeoHeadTagType.meta:
          return SeoMetaTag(name: properties['name'], httpEquiv: properties['httpEquiv'], content: properties['content']);
        case SeoHeadTagType.link:
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

class SeoMetaTag implements SeoHeadTag {
  @override
  SeoHeadTagType get tagType => SeoHeadTagType.meta;

  final String? name;
  final String? httpEquiv;
  final String? content;

  const SeoMetaTag({this.name, this.httpEquiv, this.content});

  @override
  String encode() {
    final Map<String, dynamic> json = {'type': tagType, 'properties': <String, dynamic>{}};

    // Only include non-null properties for cleaner output
    if (name != null) json['properties']['name'] = name;
    if (httpEquiv != null) json['properties']['httpEquiv'] = httpEquiv;
    if (content != null) json['properties']['content'] = content;

    return jsonEncode(json);
  }
}

class SeoLinkTag implements SeoHeadTag {
  @override
  SeoHeadTagType get tagType => SeoHeadTagType.link;

  final String? title;
  final String? rel;
  final String? type;
  final String? hreflang;
  final String? href;
  final String? media;

  const SeoLinkTag({this.title, this.rel, this.type, this.hreflang, this.href, this.media});

  @override
  String encode() {
    final Map<String, dynamic> json = {'type': tagType, 'properties': <String, dynamic>{}};

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

//TODO: Remove this class
class HeadTags implements SeoTag {
  final List<SeoHeadTag> tags;

  const HeadTags({required this.tags});
}
