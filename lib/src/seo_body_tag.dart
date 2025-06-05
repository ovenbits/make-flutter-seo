part of 'seo_tag.dart';

sealed class SeoBodyTag implements SeoTag {}

enum TextTagStyle { h1, h2, h3, h4, h5, h6, p }

class TextTag implements SeoBodyTag {
  final String text;
  final TextTagStyle style;

  const TextTag({required this.text, required this.style});
}

class ImageTag implements SeoBodyTag {
  final String alt;
  final String src;

  const ImageTag({required this.alt, required this.src});
}

class LinkTag implements SeoBodyTag {
  final String anchor;
  final String href;
  final String? rel;

  const LinkTag({required this.anchor, required this.href, required this.rel});
}

class HtmlTag implements SeoBodyTag {
  final String html;

  const HtmlTag({required this.html});
}
