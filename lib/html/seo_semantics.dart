// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// 🌎 Project imports:
import 'package:make_flutter_seo/src/seo_tag.dart';
import 'package:uuid/uuid.dart';

/// Collection of custom [SemanticsTag]s used by the SEO layer.
///
/// These tags never leave the engine – they are only inspected while
/// traversing the semantics tree in [SemanticsTree] to recognise special
/// HTML-related widgets that do **not** need to be announced by a11y tools.
///
/// Because they are plain [SemanticsTag]s they add zero runtime overhead and
/// are automatically preserved across semantics merges.
extension type const SeoSemanticsTags(String _) implements String {
  static const SemanticsTag html = SemanticsTag('seo_html');
  static const SemanticsTag head = SemanticsTag('seo_head');
}

/// A tiny proxy widget that injects a given [SemanticsTag] and an optional
/// [data] string into the underlying [SemanticsNode].
///
/// The node is also hidden from accessibility so it will not be announced by
/// screen-readers, but the tag and the value remain queryable while walking
/// the semantics tree.
class SeoTaggedSemantics extends SingleChildRenderObjectWidget {
  const SeoTaggedSemantics({super.key, required this.tag, required this.data, required Widget child}) : super(child: child);

  final SemanticsTag tag;
  final SeoHeadTag data;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderSeoTaggedSemantics(tag: tag, data: data);
  }

  @override
  void updateRenderObject(BuildContext context, RenderSeoTaggedSemantics renderObject) {
    renderObject
      ..tag = tag
      ..data = data;
  }
}

class RenderSeoTaggedSemantics extends RenderProxyBox {
  RenderSeoTaggedSemantics({required SemanticsTag tag, required SeoHeadTag data}) : _tag = tag, _data = data;

  SemanticsTag _tag;
  SeoHeadTag _data;

  set tag(SemanticsTag value) {
    if (identical(value, _tag)) return;
    _tag = value;
    markNeedsSemanticsUpdate();
  }

  set data(SeoHeadTag value) {
    if (value == _data) return;
    _data = value;
    markNeedsSemanticsUpdate();
  }

  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);
    // Introduce a semantics boundary so this proxy gets its own node. We then
    // mark that node as hidden so screen-readers ignore it, but the data is
    // still available while traversing the semantics tree.
    config.isSemanticBoundary = true;
    config.isHidden = true;

    // `SemanticsConfiguration` does not expose a writable `tags` field for
    // the current node, but we can tag all descendant nodes, including the
    // one created for this render object, by using `addTagForChildren`.\
    config.identifier = '$_tag ${Uuid().v1()}';

    // Store the payload in the `value` field so it can be recovered later.
    config.value = jsonEncode(_data.toJson());
    config.textDirection = TextDirection.ltr;
  }
}
