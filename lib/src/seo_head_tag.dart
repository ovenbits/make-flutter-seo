part of 'seo_tag.dart';

@freezed
sealed class SeoHeadTag with _$SeoHeadTag implements SeoTag {
  const factory SeoHeadTag.meta({String? name, String? httpEquiv, String? content}) = SeoMetaTag;

  const factory SeoHeadTag.link({String? title, String? rel, String? type, String? hreflang, String? href, String? media}) =
      SeoLinkTag;

  factory SeoHeadTag.fromJson(Map<String, dynamic> json) => _$SeoHeadTagFromJson(json);
}
