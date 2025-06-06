// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:make_flutter_seo/html/seo_semantics.dart';
import 'package:make_flutter_seo/src/seo_tag.dart';

abstract class Seo {
  static Widget text({required String text, TextTagStyle style = TextTagStyle.p, required Widget child}) {
    return SeoSemantics(
      semanticsTag: SeoSemanticsTag.seoText,
      seoTag: TextTag(text: text, style: style),
      child: child,
    );
  }

  static Widget image({required String alt, required String src, required Widget child}) {
    return SeoSemantics(
      semanticsTag: SeoSemanticsTag.seoImage,
      seoTag: ImageTag(alt: alt, src: src),
      child: child,
    );
  }

  static Widget link({required String anchor, required String href, String? rel, required Widget child}) {
    return SeoSemantics(
      semanticsTag: SeoSemanticsTag.seoLink,
      seoTag: LinkTag(anchor: anchor, href: href, rel: rel),
      child: child,
    );
  }

  static Widget html({required String html, required Widget child}) {
    return SeoSemantics(
      semanticsTag: SeoSemanticsTag.seoHtml,
      seoTag: HtmlTag(html: html),
      child: child,
    );
  }

  static Widget head({required List<HeaderTag> tags, required Widget child}) {
    return SeoSemantics(
      semanticsTag: SeoSemanticsTag.seoHead,
      seoTag: HeaderTags(tags: tags),
      child: child,
    );
  }
}
