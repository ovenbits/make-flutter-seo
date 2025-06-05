// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

// 🌎 Project imports:
import 'package:make_flutter_seo/html/seo_head_semantics.dart';
import 'package:make_flutter_seo/html/seo_html_semantics.dart';
import 'package:make_flutter_seo/src/seo_tag.dart';

/// Collection of custom [SemanticsTag]s used by the SEO layer.
///
/// These tags never leave the engine – they are only inspected while
/// traversing the semantics tree in [SemanticsTree] to recognise special
/// HTML-related widgets that do **not** need to be announced by a11y tools.
///
/// Because they are plain [SemanticsTag]s they add zero runtime overhead and
/// are automatically preserved across semantics merges.
abstract interface class SeoSemanticsTag {
  static const SemanticsTag html = SemanticsTag('seo_html');
  static const SemanticsTag head = SemanticsTag('seo_head');
}

abstract class SeoSemantics extends SingleChildRenderObjectWidget {
  SemanticsTag get semanticsTag;

  const SeoSemantics({super.key, required Widget child}) : super(child: child);
}

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
    return SeoHtmlSemantics(html: html, child: child);
  }

  static Widget head({required List<SeoHeadTag> tags, required Widget child}) {
    return SeoHeadSemantics(headTags: tags, child: child);
  }
}
