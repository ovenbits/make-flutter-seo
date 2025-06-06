part of 'seo_tag.dart';

final class HeaderTags implements SeoTag {
  final List<HeaderTag> tags;

  const HeaderTags({required this.tags});
}

@freezed
sealed class HeaderTag with _$SeoHeadTag {
  const factory HeaderTag.meta({String? name, String? httpEquiv, String? content}) = SeoMetaTag;

  const factory HeaderTag.link({String? title, String? rel, String? type, String? hreflang, String? href, String? media}) =
      SeoLinkTag;

  factory HeaderTag.fromJson(Map<String, dynamic> json) => _$SeoHeadTagFromJson(json);
}
