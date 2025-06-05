// 🌎 Project imports:
import 'package:make_flutter_seo/src/seo_tag.dart';

enum TextTagStyle { h1, h2, h3, h4, h5, h6, p }

class TextTag extends SeoTag {
  final String text;
  final TextTagStyle style;

  const TextTag({required this.text, required this.style});
}

class ImageTag extends SeoTag {
  final String alt;
  final String src;

  const ImageTag({required this.alt, required this.src});
}

class LinkTag extends SeoTag {
  final String anchor;
  final String href;
  final String? rel;

  const LinkTag({required this.anchor, required this.href, required this.rel});
}

class HtmlTag extends SeoTag {
  final String html;

  const HtmlTag({required this.html});
}
