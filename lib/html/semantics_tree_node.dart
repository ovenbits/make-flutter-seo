import 'package:make_flutter_seo/make_flutter_seo.dart';

mixin SeoTreeNode {
  bool get seo;

  SeoHtml toHtml();

  String textTag({required String text, required TextTagStyle style, required String content}) {
    const tagStyleMap = {
      TextTagStyle.h1: 'h1',
      TextTagStyle.h2: 'h2',
      TextTagStyle.h3: 'h3',
      TextTagStyle.h4: 'h4',
      TextTagStyle.h5: 'h5',
      TextTagStyle.h6: 'h6',
      TextTagStyle.p: 'p',
    };

    final tag = tagStyleMap[style] ?? 'p';
    return '<$tag style="color:black;">$text</$tag>$content';
  }

  String imageTag({
    required String src,
    required String alt,
    required double? height,
    required double? width,
    required String content,
  }) {
    return '<noscript><img src="$src" alt="$alt" height="$height" width="$width"/></noscript>$content';
  }

  String linkTag({required String anchor, required String href, required String? rel, required String content}) {
    final attributes = {
      'href': href,
      'rel': rel,
    }.entries.where((entry) => entry.value != null).map((entry) => '${entry.key}="${entry.value}"').join(' ');

    return '<div><a $attributes><p>$anchor</p></a>$content</div>';
  }

  String htmlTag({required String html, required String content}) {
    return '$html$content';
  }

  String headTag({required SeoHeadTag tag}) {
    return switch (tag) {
      SeoMetaTag(:final name, :final httpEquiv, :final content) => () {
        final attributes = {
          'name': name,
          'http-equiv': httpEquiv,
          'content': content,
        }.entries.where((entry) => entry.value != null).map((entry) => '${entry.key}="${entry.value}"').join(' ');

        return '<meta $attributes flt-seo>';
      }(),
      SeoLinkTag(:final title, :final rel, :final type, :final hreflang, :final href, :final media) => () {
        final attributes = {
          'title': title,
          'rel': rel,
          'type': type,
          'hreflang': hreflang,
          'href': href,
          'media': media,
        }.entries.where((entry) => entry.value != null).map((entry) => '${entry.key}="${entry.value}"').join(' ');

        return '<link $attributes flt-seo>';
      }(),
    };
  }

  String divTag({required String content}) {
    return '<div>$content</div>';
  }
}
