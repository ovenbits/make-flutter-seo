// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:make_flutter_seo/src/seo_body_tag.dart';
import 'package:make_flutter_seo/src/seo_head_tag.dart';
import 'package:make_flutter_seo/src/seo_html.dart';
import 'package:make_flutter_seo/src/seo_tag.dart';

abstract class SeoTree {
  const SeoTree();

  Stream<void> changes();

  SeoTreeNode? traverse();

  Widget process(SeoTag tag, Widget child);
}

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
    if (tag is SeoMetaTag) {
      final attributes = {
        'name': tag.name,
        'http-equiv': tag.httpEquiv,
        'content': tag.content,
      }.entries.where((entry) => entry.value != null).map((entry) => '${entry.key}="${entry.value}"').join(' ');

      return '<meta $attributes flt-seo>';
    } else if (tag is SeoLinkTag) {
      final attributes = {
        'title': tag.title,
        'rel': tag.rel,
        'type': tag.type,
        'hreflang': tag.hreflang,
        'href': tag.href,
        'media': tag.media,
      }.entries.where((entry) => entry.value != null).map((entry) => '${entry.key}="${entry.value}"').join(' ');

      return '<link $attributes flt-seo>';
    }

    throw UnimplementedError('unsupported tag: $tag');
  }

  String divTag({required String content}) {
    return '<div>$content</div>';
  }
}
