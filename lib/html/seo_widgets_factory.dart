// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:make_flutter_seo/html/seo_semantics.dart';
import 'package:make_flutter_seo/src/seo_tag.dart';

abstract class Seo {
  static Widget text({required String text, TextTagStyle style = TextTagStyle.p, required Widget child}) {
    return Semantics(label: text, excludeSemantics: true, container: true, child: child);
  }

  static Widget image({required String alt, required String src, required Widget child}) {
    return Semantics(label: alt, value: src, image: true, excludeSemantics: true, container: true, child: child);
  }

  static Widget link({required String anchor, required String href, String? rel, required Widget child}) {
    return Semantics(label: anchor, value: href, link: true, container: true, child: child);
  }

  static Widget html({required String html, required Widget child}) {
    return SeoSemantics(
      semanticsTag: SeoSemanticsTag.html,
      seoTag: HtmlTag(html: html),
      child: child,
    );
  }

  static Widget head({required List<HeaderTag> tags, required Widget child}) {
    return SeoSemantics(
      semanticsTag: SeoSemanticsTag.head,
      seoTag: HeaderTags(tags: tags),
      child: child,
    );
  }
}
