// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppUserDTO {

 String get userId; UserProfileDTO get profile;
/// Create a copy of AppUserDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUserDTOCopyWith<AppUserDTO> get copyWith => _$AppUserDTOCopyWithImpl<AppUserDTO>(this as AppUserDTO, _$identity);

  /// Serializes this AppUserDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUserDTO&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.profile, profile) || other.profile == profile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,profile);

@override
String toString() {
  return 'AppUserDTO(userId: $userId, profile: $profile)';
}


}

/// @nodoc
abstract mixin class $AppUserDTOCopyWith<$Res>  {
  factory $AppUserDTOCopyWith(AppUserDTO value, $Res Function(AppUserDTO) _then) = _$AppUserDTOCopyWithImpl;
@useResult
$Res call({
 String userId, UserProfileDTO profile
});


$UserProfileDTOCopyWith<$Res> get profile;

}
/// @nodoc
class _$AppUserDTOCopyWithImpl<$Res>
    implements $AppUserDTOCopyWith<$Res> {
  _$AppUserDTOCopyWithImpl(this._self, this._then);

  final AppUserDTO _self;
  final $Res Function(AppUserDTO) _then;

/// Create a copy of AppUserDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? profile = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfileDTO,
  ));
}
/// Create a copy of AppUserDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileDTOCopyWith<$Res> get profile {
  
  return $UserProfileDTOCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppUserDTO].
extension AppUserDTOPatterns on AppUserDTO {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppUserDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppUserDTO() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppUserDTO value)  $default,){
final _that = this;
switch (_that) {
case _AppUserDTO():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppUserDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AppUserDTO() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  UserProfileDTO profile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppUserDTO() when $default != null:
return $default(_that.userId,_that.profile);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  UserProfileDTO profile)  $default,) {final _that = this;
switch (_that) {
case _AppUserDTO():
return $default(_that.userId,_that.profile);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  UserProfileDTO profile)?  $default,) {final _that = this;
switch (_that) {
case _AppUserDTO() when $default != null:
return $default(_that.userId,_that.profile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppUserDTO implements AppUserDTO {
  const _AppUserDTO({required this.userId, required this.profile});
  factory _AppUserDTO.fromJson(Map<String, dynamic> json) => _$AppUserDTOFromJson(json);

@override final  String userId;
@override final  UserProfileDTO profile;

/// Create a copy of AppUserDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppUserDTOCopyWith<_AppUserDTO> get copyWith => __$AppUserDTOCopyWithImpl<_AppUserDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppUserDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppUserDTO&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.profile, profile) || other.profile == profile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,profile);

@override
String toString() {
  return 'AppUserDTO(userId: $userId, profile: $profile)';
}


}

/// @nodoc
abstract mixin class _$AppUserDTOCopyWith<$Res> implements $AppUserDTOCopyWith<$Res> {
  factory _$AppUserDTOCopyWith(_AppUserDTO value, $Res Function(_AppUserDTO) _then) = __$AppUserDTOCopyWithImpl;
@override @useResult
$Res call({
 String userId, UserProfileDTO profile
});


@override $UserProfileDTOCopyWith<$Res> get profile;

}
/// @nodoc
class __$AppUserDTOCopyWithImpl<$Res>
    implements _$AppUserDTOCopyWith<$Res> {
  __$AppUserDTOCopyWithImpl(this._self, this._then);

  final _AppUserDTO _self;
  final $Res Function(_AppUserDTO) _then;

/// Create a copy of AppUserDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? profile = null,}) {
  return _then(_AppUserDTO(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfileDTO,
  ));
}

/// Create a copy of AppUserDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileDTOCopyWith<$Res> get profile {
  
  return $UserProfileDTOCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// @nodoc
mixin _$UserProfileDTO {

 String get name; String get email; String? get profilePicture;
/// Create a copy of UserProfileDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileDTOCopyWith<UserProfileDTO> get copyWith => _$UserProfileDTOCopyWithImpl<UserProfileDTO>(this as UserProfileDTO, _$identity);

  /// Serializes this UserProfileDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,profilePicture);

@override
String toString() {
  return 'UserProfileDTO(name: $name, email: $email, profilePicture: $profilePicture)';
}


}

/// @nodoc
abstract mixin class $UserProfileDTOCopyWith<$Res>  {
  factory $UserProfileDTOCopyWith(UserProfileDTO value, $Res Function(UserProfileDTO) _then) = _$UserProfileDTOCopyWithImpl;
@useResult
$Res call({
 String name, String email, String? profilePicture
});




}
/// @nodoc
class _$UserProfileDTOCopyWithImpl<$Res>
    implements $UserProfileDTOCopyWith<$Res> {
  _$UserProfileDTOCopyWithImpl(this._self, this._then);

  final UserProfileDTO _self;
  final $Res Function(UserProfileDTO) _then;

/// Create a copy of UserProfileDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? profilePicture = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,profilePicture: freezed == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfileDTO].
extension UserProfileDTOPatterns on UserProfileDTO {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileDTO() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileDTO value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileDTO():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileDTO value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileDTO() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email,  String? profilePicture)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileDTO() when $default != null:
return $default(_that.name,_that.email,_that.profilePicture);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email,  String? profilePicture)  $default,) {final _that = this;
switch (_that) {
case _UserProfileDTO():
return $default(_that.name,_that.email,_that.profilePicture);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email,  String? profilePicture)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileDTO() when $default != null:
return $default(_that.name,_that.email,_that.profilePicture);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfileDTO implements UserProfileDTO {
  const _UserProfileDTO({required this.name, required this.email, this.profilePicture});
  factory _UserProfileDTO.fromJson(Map<String, dynamic> json) => _$UserProfileDTOFromJson(json);

@override final  String name;
@override final  String email;
@override final  String? profilePicture;

/// Create a copy of UserProfileDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileDTOCopyWith<_UserProfileDTO> get copyWith => __$UserProfileDTOCopyWithImpl<_UserProfileDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileDTO&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,profilePicture);

@override
String toString() {
  return 'UserProfileDTO(name: $name, email: $email, profilePicture: $profilePicture)';
}


}

/// @nodoc
abstract mixin class _$UserProfileDTOCopyWith<$Res> implements $UserProfileDTOCopyWith<$Res> {
  factory _$UserProfileDTOCopyWith(_UserProfileDTO value, $Res Function(_UserProfileDTO) _then) = __$UserProfileDTOCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String? profilePicture
});




}
/// @nodoc
class __$UserProfileDTOCopyWithImpl<$Res>
    implements _$UserProfileDTOCopyWith<$Res> {
  __$UserProfileDTOCopyWithImpl(this._self, this._then);

  final _UserProfileDTO _self;
  final $Res Function(_UserProfileDTO) _then;

/// Create a copy of UserProfileDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? profilePicture = freezed,}) {
  return _then(_UserProfileDTO(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,profilePicture: freezed == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
