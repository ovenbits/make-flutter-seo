// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:make_flutter_seo/html/seo_widgets_factory.dart';

// 🌎 Project imports:
import 'package:make_flutter_seo/src/seo_tag.dart';
import 'package:uuid/uuid.dart';

/// A tiny proxy widget that injects a given [SemanticsTag] and an optional
/// [data] string into the underlying [SemanticsNode].
///
/// The node is also hidden from accessibility so it will not be announced by
/// screen-readers, but the tag and the value remain queryable while walking
/// the semantics tree.
class SeoHeadSemantics extends SeoSemantics {
  const SeoHeadSemantics({super.key, required this.headTags, required super.child});

  @override
  final SemanticsTag semanticsTag = SeoSemanticsTag.head;

  final List<SeoHeadTag> headTags;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderSeoHeadSemantics(semanticsTag: semanticsTag, headTags: headTags);
  }
}

class RenderSeoHeadSemantics extends RenderProxyBox {
  RenderSeoHeadSemantics({required this.semanticsTag, required this.headTags});

  final SemanticsTag semanticsTag;
  final List<SeoHeadTag> headTags;

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
    config.identifier = '$semanticsTag ${Uuid().v1()}';

    // Store the payload in the `value` field so it can be recovered later.
    config.value = jsonEncode(headTags.map((tag) => tag.toJson()).toList());
    config.textDirection = TextDirection.ltr;
  }
}
