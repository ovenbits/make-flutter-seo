// 🐦 Flutter imports:
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:make_flutter_seo/html/seo_widgets_factory.dart';

// 🌎 Project imports:
import 'package:uuid/uuid.dart';

class SeoHtmlSemantics extends SeoSemantics {
  const SeoHtmlSemantics({super.key, required this.html, required super.child});

  @override
  final SemanticsTag semanticsTag = SeoSemanticsTag.html;

  final String html;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderSeoHtmlSemantics(semanticsTag: semanticsTag, html: html);
  }
}

class RenderSeoHtmlSemantics extends RenderProxyBox {
  RenderSeoHtmlSemantics({required this.semanticsTag, required this.html});

  final SemanticsTag semanticsTag;
  final String html;

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
    config.value = html;
    config.textDirection = TextDirection.ltr;
  }
}
