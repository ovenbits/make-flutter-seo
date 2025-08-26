// 🐦 Flutter imports:
import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:make_flutter_seo/make_flutter_seo.dart';

// 🌎 Project imports:
import 'package:uuid/uuid.dart';

/// Collection of custom [SemanticsTag]s used by the SEO layer.
///
/// These tags never leave the engine – they are only inspected while
/// traversing the semantics tree in [SemanticsTree] to recognise special
/// HTML-related widgets that do **not** need to be announced by a11y tools.
///
/// Because they are plain [SemanticsTag]s they add zero runtime overhead and
/// are automatically preserved across semantics merges.
abstract interface class SeoSemanticsTag {
  static const SemanticsTag seoHtml = SemanticsTag('seo_html');
  static const SemanticsTag seoHead = SemanticsTag('seo_head');
  static const SemanticsTag seoText = SemanticsTag('seo_text');
  static const SemanticsTag seoImage = SemanticsTag('seo_image');
  static const SemanticsTag seoLink = SemanticsTag('seo_link');
}

final class SeoSemantics extends SingleChildRenderObjectWidget {
  const SeoSemantics({super.key, required this.semanticsTag, required this.seoTag, required super.child});

  final SemanticsTag semanticsTag;

  final SeoTag seoTag;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderSeoSemantics(semanticsTag: semanticsTag, seoTag: seoTag);
  }
}

final class RenderSeoSemantics extends RenderProxyBox {
  RenderSeoSemantics({required this.semanticsTag, required this.seoTag});

  final SemanticsTag semanticsTag;

  final SeoTag seoTag;

  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);
    // Introduce a semantics boundary so this proxy gets its own node. We then
    // mark that node as hidden so screen-readers ignore it, but the data is
    // still available while traversing the semantics tree.
    config.isSemanticBoundary = true;
    config.isHidden = true;
    config.isBlockingUserActions = false;
    config.isSelected = false;
    config.isFocusable = false;
    config.identifier = '$semanticsTag ${Uuid().v1()}';
    config.value = jsonEncode(seoTag.toJson());
    config.textDirection = TextDirection.ltr;
  }
}
