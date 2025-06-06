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
  bool get seo => _text || _link || _image || _seoText || _seoImage || _seoLink || _seoHtml || _seoHead;

  bool get _text {
    return parent.label.isNotEmpty;
  }

  bool get _link {
    return parent.hasFlag(SemanticsFlag.isLink) && parent.value.isNotEmpty;
  }

  bool get _image {
    return parent.hasFlag(SemanticsFlag.isImage) && parent.value.isNotEmpty;
  }

  bool get _seoText {
    return parent.identifier.contains(SeoSemanticsTag.seoText.name);
  }

  bool get _seoImage {
    return parent.identifier.contains(SeoSemanticsTag.seoImage.name);
  }

  bool get _seoLink {
    return parent.identifier.contains(SeoSemanticsTag.seoLink.name);
  }

  bool get _seoHtml {
    return parent.identifier.contains(SeoSemanticsTag.seoHtml.name);
  }

  bool get _seoHead {
    return parent.identifier.contains(SeoSemanticsTag.seoHead.name);
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
    } else if (_seoText) {
      final TextTag tag = TextTag.fromJson(jsonDecode(parent.value));
      return 'text: ${tag.text} | style: ${tag.style}';
    } else if (_seoImage) {
      final ImageTag tag = ImageTag.fromJson(jsonDecode(parent.value));
      return 'image: ${tag.alt} | url: ${tag.src}';
    } else if (_seoLink) {
      final LinkTag tag = LinkTag.fromJson(jsonDecode(parent.value));
      return 'link: ${tag.anchor} | url: ${tag.href} | rel: ${tag.rel}';
    } else if (_seoHtml) {
      final HtmlTag tag = HtmlTag.fromJson(jsonDecode(parent.value));
      return 'html: ${tag.html}';
    } else if (_seoHead) {
      final HeaderTags tag = HeaderTags.fromJson(jsonDecode(parent.value));
      return 'head: ${tag.tags.map((tag) => tag.toString()).join('\n')}';
    } else {
      return 'div: ${children.length}';
    }
  }

  @override
  SeoHtml toHtml() {
    final html = children.map((e) => e.toHtml()).fold(const SeoHtml(head: '', body: ''), (h1, h2) => h1 + h2);

    if (_link) {
      try {
        final LinkTag tag = LinkTag.fromJson(jsonDecode(parent.value));
        return html.copyWith(
          body: linkTag(anchor: tag.anchor, href: tag.href, rel: tag.rel, content: html.body),
        );
      } catch (_) {
        return html.copyWith(
          body: linkTag(anchor: parent.label, href: parent.value, rel: null, content: html.body),
        );
      }
    } else if (_image || _seoImage) {
      try {
        final ImageTag tag = ImageTag.fromJson(jsonDecode(parent.value));
        return html.copyWith(
          body: imageTag(
            src: tag.src,
            alt: tag.alt,
            height: parent.rect.height,
            width: parent.rect.width,
            content: html.body,
          ),
        );
      } catch (_) {
        return html.copyWith(
          body: imageTag(
            src: parent.value,
            alt: parent.label,
            height: parent.rect.height,
            width: parent.rect.width,
            content: html.body,
          ),
        );
      }
    } else if (_text || _seoText) {
      try {
        final TextTag tag = TextTag.fromJson(jsonDecode(parent.value));
        return html.copyWith(
          body: textTag(text: tag.text, style: tag.style, content: html.body),
        );
      } catch (_) {
        return html.copyWith(
          body: textTag(text: parent.label, style: TextTagStyle.p, content: html.body),
        );
      }
    } else if (_seoHead) {
      final HeaderTags tag = HeaderTags.fromJson(jsonDecode(parent.value));
      return html.copyWith(head: html.head + tag.tags.map((tag) => headTag(tag: tag)).join('\n'));
    } else if (_seoHtml) {
      final HtmlTag tag = HtmlTag.fromJson(jsonDecode(parent.value));
      return html.copyWith(
        body: htmlTag(html: tag.html, content: html.body),
      );
    } else {
      return html.copyWith(body: divTag(content: html.body));
    }
  }
}
