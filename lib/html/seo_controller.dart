import 'dart:async';
import 'dart:js_interop';
import 'package:make_flutter_seo/html/node_list_extension.dart';
import 'package:make_flutter_seo/html/semantics_tree.dart';
import 'package:web/web.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rxdart/rxdart.dart';
import 'package:make_flutter_seo/src/seo_html.dart';

class SeoController extends StatefulWidget {
  final bool enabled;
  final Widget child;

  const SeoController({super.key, this.enabled = true, required this.child});

  @override
  State<SeoController> createState() => _SeoControllerState();
}

class _SeoControllerState extends State<SeoController> {
  final _tree = SemanticsTree();

  StreamSubscription? _subscription;
  int? _headHash;
  int? _bodyHash;

  @override
  void initState() {
    super.initState();
    _subscribe();
  }

  @override
  void didUpdateWidget(covariant SeoController oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.enabled != widget.enabled) {
      _subscribe();
    }
  }

  void _subscribe() {
    _subscription?.cancel();
    _subscription = null;

    if (widget.enabled) {
      _subscription = _tree.changes().debounceTime(const Duration(milliseconds: 500)).listen((_) => _update());
    }
  }

  void _update() async {
    if (!mounted) return;

    if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle) {
      await SchedulerBinding.instance.endOfFrame;
      if (!mounted) return;
    }

    final html = _tree.traverse()?.toHtml();
    if (html != null) {
      _updateHead(html);
      _updateBody(html);
    }
  }

  void _updateHead(SeoHtml html) {
    final head = document.head;
    if (head == null) return;

    final hash = html.head.hashCode;
    if (_headHash == hash) return;
    _headHash = hash;

    head.querySelectorAll('[flt-seo]').toList().nonNulls.forEach((node) => head.removeChild(node));

    head.insertAdjacentHTML('beforeEnd', html.head.toJS);
  }

  void _updateBody(SeoHtml html) {
    final body = document.body;
    if (body == null) return;

    final hash = html.body.hashCode;
    if (_bodyHash == hash) return;
    _bodyHash = hash;

    body.querySelectorAll('[flt-seo]').toList().nonNulls.forEach((node) => body.removeChild(node));

    body.insertAdjacentHTML(
      'afterBegin',
      '<div flt-seo aria-hidden="true" role="presentation" style="position:absolute;inset:0;pointer-events:none;z-index:-1;overflow:hidden">${html.body}</div>'
          .toJS,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    super.dispose();
  }
}
