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
SeoHeadTag _$SeoHeadTagFromJson(
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
  'SeoHeadTag',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$SeoHeadTag {



  /// Serializes this SeoHeadTag to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeoHeadTag);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SeoHeadTag()';
}


}

/// @nodoc
class $SeoHeadTagCopyWith<$Res>  {
$SeoHeadTagCopyWith(SeoHeadTag _, $Res Function(SeoHeadTag) __);
}


/// @nodoc
@JsonSerializable()

class SeoMetaTag implements SeoHeadTag {
  const SeoMetaTag({this.name, this.httpEquiv, this.content, final  String? $type}): $type = $type ?? 'meta';
  factory SeoMetaTag.fromJson(Map<String, dynamic> json) => _$SeoMetaTagFromJson(json);

 final  String? name;
 final  String? httpEquiv;
 final  String? content;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of SeoHeadTag
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeoMetaTag&&(identical(other.name, name) || other.name == name)&&(identical(other.httpEquiv, httpEquiv) || other.httpEquiv == httpEquiv)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,httpEquiv,content);

@override
String toString() {
  return 'SeoHeadTag.meta(name: $name, httpEquiv: $httpEquiv, content: $content)';
}


}

/// @nodoc
abstract mixin class $SeoMetaTagCopyWith<$Res> implements $SeoHeadTagCopyWith<$Res> {
  factory $SeoMetaTagCopyWith(SeoMetaTag value, $Res Function(SeoMetaTag) _then) = _$SeoMetaTagCopyWithImpl;
@useResult
$Res call({
 String? name, String? httpEquiv, String? content
});




}
/// @nodoc
class _$SeoMetaTagCopyWithImpl<$Res>
    implements $SeoMetaTagCopyWith<$Res> {
  _$SeoMetaTagCopyWithImpl(this._self, this._then);

  final SeoMetaTag _self;
  final $Res Function(SeoMetaTag) _then;

/// Create a copy of SeoHeadTag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? httpEquiv = freezed,Object? content = freezed,}) {
  return _then(SeoMetaTag(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,httpEquiv: freezed == httpEquiv ? _self.httpEquiv : httpEquiv // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SeoLinkTag implements SeoHeadTag {
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


/// Create a copy of SeoHeadTag
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
  return 'SeoHeadTag.link(title: $title, rel: $rel, type: $type, hreflang: $hreflang, href: $href, media: $media)';
}


}

/// @nodoc
abstract mixin class $SeoLinkTagCopyWith<$Res> implements $SeoHeadTagCopyWith<$Res> {
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

/// Create a copy of SeoHeadTag
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
