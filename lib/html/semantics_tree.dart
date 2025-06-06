// 🎯 Dart imports:
import 'dart:async';
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:make_flutter_seo/html/semantics_tree_node.dart';
import 'package:make_flutter_seo/html/seo_semantics.dart';

// 🌎 Project imports:
import 'package:make_flutter_seo/src/seo_html.dart';
import 'package:make_flutter_seo/src/seo_tag.dart';

final class SemanticsTree {
  StreamController<void>? controller;

  Stream<void> changes() {
    SemanticsHandle? handle;

    void onStart() {
      handle = SemanticsBinding.instance.ensureSemantics();
      // ignore: deprecated_member_use
      WidgetsBinding.instance.pipelineOwner.semanticsOwner?.addListener(_onSemanticsUpdate);
      SemanticsBinding.instance.addSemanticsEnabledListener(_onSemanticsUpdate);
      SemanticsBinding.instance.addSemanticsActionListener((event) => _onSemanticsUpdate());
    }

    void onStop() {
      // ignore: deprecated_member_use
      WidgetsBinding.instance.pipelineOwner.semanticsOwner?.removeListener(_onSemanticsUpdate);
      SemanticsBinding.instance.removeSemanticsEnabledListener(_onSemanticsUpdate);
      SemanticsBinding.instance.removeSemanticsActionListener((event) => _onSemanticsUpdate());
      handle?.dispose();
      handle = null;
    }

    controller = StreamController<void>(onListen: onStart, onPause: onStop, onResume: onStart, onCancel: onStop);

    return controller!.stream;
  }

  void _onSemanticsUpdate() {
    controller?.add(null);
  }

  SeoTreeNode? traverse() {
    // ignore: deprecated_member_use
    final node = WidgetsBinding.instance.pipelineOwner.semanticsOwner?.rootSemanticsNode;
    if (node == null) return null;

    return _traverse(node);
  }

  _Node _traverse(SemanticsNode node) {
    if (node.mergeAllDescendantsIntoThisNode) {
      return _Node(parent: node, children: []);
    }

    final children = <SemanticsNode>[];
    node.visitChildren((node) {
      children.add(node);
      return true;
    });

    return _Node(
      parent: node,
      children: children.map(_traverse).expand((node) => node.seo ? [node] : node.children).toList(),
    );
  }
}

class _Node with SeoTreeNode {
  final SemanticsNode parent;
  final List<_Node> children;

  const _Node({required this.parent, required this.children});

  @override
  bool get seo => _text || _link || _image || _html || _head;

  bool get _text {
    return parent.label.isNotEmpty;
  }

  bool get _link {
    return parent.hasFlag(SemanticsFlag.isLink) && parent.value.isNotEmpty;
  }

  bool get _image {
    return parent.hasFlag(SemanticsFlag.isImage) && parent.value.isNotEmpty;
  }

  bool get _html {
    return parent.identifier.contains(SeoSemanticsTag.html.name);
  }

  bool get _head {
    return parent.identifier.contains(SeoSemanticsTag.head.name);
  }

  @override
  String toString() {
    final label = parent.label.replaceAll('\n', ' ');
    final value = parent.value;

    if (_link) {
      return 'link: $label | url: $value';
    } else if (_image) {
      return 'image: $label | url: $value';
    } else if (_text) {
      return 'text: $label';
    } else if (_html) {
      return 'html: $value';
    } else if (_head) {
      return 'head: $value';
    } else {
      return 'div: ${children.length}';
    }
  }

  @override
  SeoHtml toHtml() {
    final html = children.map((e) => e.toHtml()).fold(const SeoHtml(head: '', body: ''), (h1, h2) => h1 + h2);

    if (_link) {
      return html.copyWith(
        body: linkTag(anchor: parent.label, href: parent.value, rel: null, content: html.body),
      );
    } else if (_image) {
      return html.copyWith(
        body: imageTag(
          src: parent.value,
          alt: parent.label,
          height: parent.rect.height,
          width: parent.rect.width,
          content: html.body,
        ),
      );
    } else if (_text) {
      return html.copyWith(
        body: textTag(text: parent.label, style: TextTagStyle.p, content: html.body),
      );
    } else if (_head) {
      final List<HeaderTag> tags = (jsonDecode(parent.value) as List)
          .map((json) => HeaderTag.fromJson(json as Map<String, dynamic>))
          .toList();
      return html.copyWith(head: html.head + tags.map((tag) => headTag(tag: tag)).join('\n'));
    } else if (_html) {
      return html.copyWith(
        body: htmlTag(html: parent.value, content: html.body),
      );
    } else {
      return html.copyWith(body: divTag(content: html.body));
    }
  }
}
