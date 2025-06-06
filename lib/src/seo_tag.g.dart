// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seo_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextTag _$TextTagFromJson(Map<String, dynamic> json) => TextTag(
  text: json['text'] as String,
  style: $enumDecode(_$TextTagStyleEnumMap, json['style']),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$TextTagToJson(TextTag instance) => <String, dynamic>{
  'text': instance.text,
  'style': _$TextTagStyleEnumMap[instance.style]!,
  'runtimeType': instance.$type,
};

const _$TextTagStyleEnumMap = {
  TextTagStyle.h1: 'h1',
  TextTagStyle.h2: 'h2',
  TextTagStyle.h3: 'h3',
  TextTagStyle.h4: 'h4',
  TextTagStyle.h5: 'h5',
  TextTagStyle.h6: 'h6',
  TextTagStyle.p: 'p',
};

ImageTag _$ImageTagFromJson(Map<String, dynamic> json) => ImageTag(
  alt: json['alt'] as String,
  src: json['src'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ImageTagToJson(ImageTag instance) => <String, dynamic>{
  'alt': instance.alt,
  'src': instance.src,
  'runtimeType': instance.$type,
};

LinkTag _$LinkTagFromJson(Map<String, dynamic> json) => LinkTag(
  anchor: json['anchor'] as String,
  href: json['href'] as String,
  rel: json['rel'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$LinkTagToJson(LinkTag instance) => <String, dynamic>{
  'anchor': instance.anchor,
  'href': instance.href,
  'rel': instance.rel,
  'runtimeType': instance.$type,
};

HtmlTag _$HtmlTagFromJson(Map<String, dynamic> json) => HtmlTag(
  html: json['html'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$HtmlTagToJson(HtmlTag instance) => <String, dynamic>{
  'html': instance.html,
  'runtimeType': instance.$type,
};

HeaderTags _$HeaderTagsFromJson(Map<String, dynamic> json) => HeaderTags(
  tags: (json['tags'] as List<dynamic>)
      .map((e) => HeaderTag.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$HeaderTagsToJson(HeaderTags instance) =>
    <String, dynamic>{'tags': instance.tags, 'runtimeType': instance.$type};

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
