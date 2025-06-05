// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seo_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeoMetaTag _$SeoMetaTagFromJson(Map<String, dynamic> json) => SeoMetaTag(
  name: json['name'] as String?,
  httpEquiv: json['httpEquiv'] as String?,
  content: json['content'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SeoMetaTagToJson(SeoMetaTag instance) =>
    <String, dynamic>{
      'name': instance.name,
      'httpEquiv': instance.httpEquiv,
      'content': instance.content,
      'runtimeType': instance.$type,
    };

SeoLinkTag _$SeoLinkTagFromJson(Map<String, dynamic> json) => SeoLinkTag(
  title: json['title'] as String?,
  rel: json['rel'] as String?,
  type: json['type'] as String?,
  hreflang: json['hreflang'] as String?,
  href: json['href'] as String?,
  media: json['media'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SeoLinkTagToJson(SeoLinkTag instance) =>
    <String, dynamic>{
      'title': instance.title,
      'rel': instance.rel,
      'type': instance.type,
      'hreflang': instance.hreflang,
      'href': instance.href,
      'media': instance.media,
      'runtimeType': instance.$type,
    };
