// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:make_flutter_seo/src/seo_tag.dart';

abstract class Seo {
  static Widget text({required String text, TextTagStyle style = TextTagStyle.p, required Widget child}) => child;

  static Widget image({required String alt, required String src, required Widget child}) => child;

  static Widget link({required String anchor, required String href, String? rel, required Widget child}) => child;

  static Widget html({required String html, required Widget child}) => child;

  static Widget head({required List<SeoHeadTag> tags, required Widget child}) => child;
}
