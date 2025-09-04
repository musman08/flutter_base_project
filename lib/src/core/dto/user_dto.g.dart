// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUserDTO _$AppUserDTOFromJson(Map<String, dynamic> json) => _AppUserDTO(
  userId: json['userId'] as String,
  profile: UserProfileDTO.fromJson(json['profile'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AppUserDTOToJson(_AppUserDTO instance) =>
    <String, dynamic>{'userId': instance.userId, 'profile': instance.profile};

_UserProfileDTO _$UserProfileDTOFromJson(Map<String, dynamic> json) =>
    _UserProfileDTO(
      name: json['name'] as String,
      email: json['email'] as String,
      profilePicture: json['profilePicture'] as String?,
    );

Map<String, dynamic> _$UserProfileDTOToJson(_UserProfileDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'profilePicture': instance.profilePicture,
    };
