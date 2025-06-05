// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:make_flutter_seo/make_flutter_seo.dart';

class AppImage extends StatelessWidget {
  final String alt;
  final String src;

  const AppImage({
    super.key,
    required this.alt,
    required this.src,
  });

  @override
  Widget build(BuildContext context) {
    return Seo.image(
      alt: alt,
      src: src,
      child: Image.network(src),
    );
  }
}
