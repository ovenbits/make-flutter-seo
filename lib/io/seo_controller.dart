// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:make_flutter_seo/src/seo_tree.dart';

class SeoController extends StatelessWidget {
  final Widget child;

  const SeoController({super.key, bool enabled = false, required SeoTree tree, required this.child});

  @override
  Widget build(BuildContext context) => child;
}
