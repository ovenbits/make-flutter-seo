// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'seo_tag.freezed.dart';
part 'seo_tag.g.dart';

enum TextTagStyle { h1, h2, h3, h4, h5, h6, p }

@freezed
sealed class SeoTag with _$SeoTag {
  // Body tags
  const factory SeoTag.text({required String text, required TextTagStyle style}) = TextTag;

  const factory SeoTag.image({required String alt, required String src}) = ImageTag;

  const factory SeoTag.link({required String anchor, required String href, String? rel}) = LinkTag;

  const factory SeoTag.html({required String html}) = HtmlTag;

  // Head tags
  const factory SeoTag.headers({required List<HeaderTag> tags}) = HeaderTags;

  factory SeoTag.fromJson(Map<String, dynamic> json) => _$SeoTagFromJson(json);
}

@freezed
sealed class HeaderTag with _$HeaderTag {
  const factory HeaderTag.meta({String? name, String? httpEquiv, String? content, String? property}) = SeoMetaTag;

  const factory HeaderTag.link({String? title, String? rel, String? type, String? hreflang, String? href, String? media}) =
      SeoLinkTag;

  factory HeaderTag.fromJson(Map<String, dynamic> json) => _$HeaderTagFromJson(json);
}
