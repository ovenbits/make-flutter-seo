// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seo_tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
SeoTag _$SeoTagFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'text':
          return TextTag.fromJson(
            json
          );
                case 'image':
          return ImageTag.fromJson(
            json
          );
                case 'link':
          return LinkTag.fromJson(
            json
          );
                case 'html':
          return HtmlTag.fromJson(
            json
          );
                case 'headers':
          return HeaderTags.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'SeoTag',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$SeoTag {



  /// Serializes this SeoTag to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeoTag);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SeoTag()';
}


}

/// @nodoc
class $SeoTagCopyWith<$Res>  {
$SeoTagCopyWith(SeoTag _, $Res Function(SeoTag) __);
}


/// @nodoc
@JsonSerializable()

class TextTag implements SeoTag {
  const TextTag({required this.text, required this.style, final  String? $type}): $type = $type ?? 'text';
  factory TextTag.fromJson(Map<String, dynamic> json) => _$TextTagFromJson(json);

 final  String text;
 final  TextTagStyle style;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of SeoTag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextTagCopyWith<TextTag> get copyWith => _$TextTagCopyWithImpl<TextTag>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextTagToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextTag&&(identical(other.text, text) || other.text == text)&&(identical(other.style, style) || other.style == style));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,style);

@override
String toString() {
  return 'SeoTag.text(text: $text, style: $style)';
}


}

/// @nodoc
abstract mixin class $TextTagCopyWith<$Res> implements $SeoTagCopyWith<$Res> {
  factory $TextTagCopyWith(TextTag value, $Res Function(TextTag) _then) = _$TextTagCopyWithImpl;
@useResult
$Res call({
 String text, TextTagStyle style
});




}
/// @nodoc
class _$TextTagCopyWithImpl<$Res>
    implements $TextTagCopyWith<$Res> {
  _$TextTagCopyWithImpl(this._self, this._then);

  final TextTag _self;
  final $Res Function(TextTag) _then;

/// Create a copy of SeoTag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,Object? style = null,}) {
  return _then(TextTag(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as TextTagStyle,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ImageTag implements SeoTag {
  const ImageTag({required this.alt, required this.src, final  String? $type}): $type = $type ?? 'image';
  factory ImageTag.fromJson(Map<String, dynamic> json) => _$ImageTagFromJson(json);

 final  String alt;
 final  String src;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of SeoTag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageTagCopyWith<ImageTag> get copyWith => _$ImageTagCopyWithImpl<ImageTag>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageTagToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageTag&&(identical(other.alt, alt) || other.alt == alt)&&(identical(other.src, src) || other.src == src));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,alt,src);

@override
String toString() {
  return 'SeoTag.image(alt: $alt, src: $src)';
}


}

/// @nodoc
abstract mixin class $ImageTagCopyWith<$Res> implements $SeoTagCopyWith<$Res> {
  factory $ImageTagCopyWith(ImageTag value, $Res Function(ImageTag) _then) = _$ImageTagCopyWithImpl;
@useResult
$Res call({
 String alt, String src
});




}
/// @nodoc
class _$ImageTagCopyWithImpl<$Res>
    implements $ImageTagCopyWith<$Res> {
  _$ImageTagCopyWithImpl(this._self, this._then);

  final ImageTag _self;
  final $Res Function(ImageTag) _then;

/// Create a copy of SeoTag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? alt = null,Object? src = null,}) {
  return _then(ImageTag(
alt: null == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as String,src: null == src ? _self.src : src // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class LinkTag implements SeoTag {
  const LinkTag({required this.anchor, required this.href, this.rel, final  String? $type}): $type = $type ?? 'link';
  factory LinkTag.fromJson(Map<String, dynamic> json) => _$LinkTagFromJson(json);

 final  String anchor;
 final  String href;
 final  String? rel;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of SeoTag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LinkTagCopyWith<LinkTag> get copyWith => _$LinkTagCopyWithImpl<LinkTag>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LinkTagToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LinkTag&&(identical(other.anchor, anchor) || other.anchor == anchor)&&(identical(other.href, href) || other.href == href)&&(identical(other.rel, rel) || other.rel == rel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anchor,href,rel);

@override
String toString() {
  return 'SeoTag.link(anchor: $anchor, href: $href, rel: $rel)';
}


}

/// @nodoc
abstract mixin class $LinkTagCopyWith<$Res> implements $SeoTagCopyWith<$Res> {
  factory $LinkTagCopyWith(LinkTag value, $Res Function(LinkTag) _then) = _$LinkTagCopyWithImpl;
@useResult
$Res call({
 String anchor, String href, String? rel
});




}
/// @nodoc
class _$LinkTagCopyWithImpl<$Res>
    implements $LinkTagCopyWith<$Res> {
  _$LinkTagCopyWithImpl(this._self, this._then);

  final LinkTag _self;
  final $Res Function(LinkTag) _then;

/// Create a copy of SeoTag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? anchor = null,Object? href = null,Object? rel = freezed,}) {
  return _then(LinkTag(
anchor: null == anchor ? _self.anchor : anchor // ignore: cast_nullable_to_non_nullable
as String,href: null == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String,rel: freezed == rel ? _self.rel : rel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class HtmlTag implements SeoTag {
  const HtmlTag({required this.html, final  String? $type}): $type = $type ?? 'html';
  factory HtmlTag.fromJson(Map<String, dynamic> json) => _$HtmlTagFromJson(json);

 final  String html;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of SeoTag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HtmlTagCopyWith<HtmlTag> get copyWith => _$HtmlTagCopyWithImpl<HtmlTag>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HtmlTagToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HtmlTag&&(identical(other.html, html) || other.html == html));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,html);

@override
String toString() {
  return 'SeoTag.html(html: $html)';
}


}

/// @nodoc
abstract mixin class $HtmlTagCopyWith<$Res> implements $SeoTagCopyWith<$Res> {
  factory $HtmlTagCopyWith(HtmlTag value, $Res Function(HtmlTag) _then) = _$HtmlTagCopyWithImpl;
@useResult
$Res call({
 String html
});




}
/// @nodoc
class _$HtmlTagCopyWithImpl<$Res>
    implements $HtmlTagCopyWith<$Res> {
  _$HtmlTagCopyWithImpl(this._self, this._then);

  final HtmlTag _self;
  final $Res Function(HtmlTag) _then;

/// Create a copy of SeoTag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? html = null,}) {
  return _then(HtmlTag(
html: null == html ? _self.html : html // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class HeaderTags implements SeoTag {
  const HeaderTags({required final  List<HeaderTag> tags, final  String? $type}): _tags = tags,$type = $type ?? 'headers';
  factory HeaderTags.fromJson(Map<String, dynamic> json) => _$HeaderTagsFromJson(json);

 final  List<HeaderTag> _tags;
 List<HeaderTag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of SeoTag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeaderTagsCopyWith<HeaderTags> get copyWith => _$HeaderTagsCopyWithImpl<HeaderTags>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HeaderTagsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HeaderTags&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'SeoTag.headers(tags: $tags)';
}


}

/// @nodoc
abstract mixin class $HeaderTagsCopyWith<$Res> implements $SeoTagCopyWith<$Res> {
  factory $HeaderTagsCopyWith(HeaderTags value, $Res Function(HeaderTags) _then) = _$HeaderTagsCopyWithImpl;
@useResult
$Res call({
 List<HeaderTag> tags
});




}
/// @nodoc
class _$HeaderTagsCopyWithImpl<$Res>
    implements $HeaderTagsCopyWith<$Res> {
  _$HeaderTagsCopyWithImpl(this._self, this._then);

  final HeaderTags _self;
  final $Res Function(HeaderTags) _then;

/// Create a copy of SeoTag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tags = null,}) {
  return _then(HeaderTags(
tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<HeaderTag>,
  ));
}


}

HeaderTag _$HeaderTagFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'meta':
          return SeoMetaTag.fromJson(
            json
          );
                case 'link':
          return SeoLinkTag.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'HeaderTag',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$HeaderTag {



  /// Serializes this HeaderTag to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HeaderTag);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HeaderTag()';
}


}

/// @nodoc
class $HeaderTagCopyWith<$Res>  {
$HeaderTagCopyWith(HeaderTag _, $Res Function(HeaderTag) __);
}


/// @nodoc
@JsonSerializable()

class SeoMetaTag implements HeaderTag {
  const SeoMetaTag({this.name, this.property, this.httpEquiv, this.content, final  String? $type}): $type = $type ?? 'meta';
  factory SeoMetaTag.fromJson(Map<String, dynamic> json) => _$SeoMetaTagFromJson(json);

 final  String? name;
 final  String? property;
 final  String? httpEquiv;
 final  String? content;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of HeaderTag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeoMetaTagCopyWith<SeoMetaTag> get copyWith => _$SeoMetaTagCopyWithImpl<SeoMetaTag>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeoMetaTagToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeoMetaTag&&(identical(other.name, name) || other.name == name)&&(identical(other.property, property) || other.property == property)&&(identical(other.httpEquiv, httpEquiv) || other.httpEquiv == httpEquiv)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,property,httpEquiv,content);

@override
String toString() {
  return 'HeaderTag.meta(name: $name, property: $property, httpEquiv: $httpEquiv, content: $content)';
}


}

/// @nodoc
abstract mixin class $SeoMetaTagCopyWith<$Res> implements $HeaderTagCopyWith<$Res> {
  factory $SeoMetaTagCopyWith(SeoMetaTag value, $Res Function(SeoMetaTag) _then) = _$SeoMetaTagCopyWithImpl;
@useResult
$Res call({
 String? name, String? property, String? httpEquiv, String? content
});




}
/// @nodoc
class _$SeoMetaTagCopyWithImpl<$Res>
    implements $SeoMetaTagCopyWith<$Res> {
  _$SeoMetaTagCopyWithImpl(this._self, this._then);

  final SeoMetaTag _self;
  final $Res Function(SeoMetaTag) _then;

/// Create a copy of HeaderTag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? property = freezed,Object? httpEquiv = freezed,Object? content = freezed,}) {
  return _then(SeoMetaTag(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,property: freezed == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String?,httpEquiv: freezed == httpEquiv ? _self.httpEquiv : httpEquiv // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SeoLinkTag implements HeaderTag {
  const SeoLinkTag({this.title, this.rel, this.type, this.hreflang, this.href, this.media, final  String? $type}): $type = $type ?? 'link';
  factory SeoLinkTag.fromJson(Map<String, dynamic> json) => _$SeoLinkTagFromJson(json);

 final  String? title;
 final  String? rel;
 final  String? type;
 final  String? hreflang;
 final  String? href;
 final  String? media;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of HeaderTag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeoLinkTagCopyWith<SeoLinkTag> get copyWith => _$SeoLinkTagCopyWithImpl<SeoLinkTag>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeoLinkTagToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeoLinkTag&&(identical(other.title, title) || other.title == title)&&(identical(other.rel, rel) || other.rel == rel)&&(identical(other.type, type) || other.type == type)&&(identical(other.hreflang, hreflang) || other.hreflang == hreflang)&&(identical(other.href, href) || other.href == href)&&(identical(other.media, media) || other.media == media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,rel,type,hreflang,href,media);

@override
String toString() {
  return 'HeaderTag.link(title: $title, rel: $rel, type: $type, hreflang: $hreflang, href: $href, media: $media)';
}


}

/// @nodoc
abstract mixin class $SeoLinkTagCopyWith<$Res> implements $HeaderTagCopyWith<$Res> {
  factory $SeoLinkTagCopyWith(SeoLinkTag value, $Res Function(SeoLinkTag) _then) = _$SeoLinkTagCopyWithImpl;
@useResult
$Res call({
 String? title, String? rel, String? type, String? hreflang, String? href, String? media
});




}
/// @nodoc
class _$SeoLinkTagCopyWithImpl<$Res>
    implements $SeoLinkTagCopyWith<$Res> {
  _$SeoLinkTagCopyWithImpl(this._self, this._then);

  final SeoLinkTag _self;
  final $Res Function(SeoLinkTag) _then;

/// Create a copy of HeaderTag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? rel = freezed,Object? type = freezed,Object? hreflang = freezed,Object? href = freezed,Object? media = freezed,}) {
  return _then(SeoLinkTag(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,rel: freezed == rel ? _self.rel : rel // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,hreflang: freezed == hreflang ? _self.hreflang : hreflang // ignore: cast_nullable_to_non_nullable
as String?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,media: freezed == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
