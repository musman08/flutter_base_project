import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class AppUserDTO with _$AppUserDTO {
  const factory AppUserDTO({
    required String userId,
    required UserProfileDTO profile,
  }) = _AppUserDTO;

  factory AppUserDTO.fromJson(Map<String, Object?> json) =>
      _$AppUserDTOFromJson(json);

  // @override
  // Map<String, dynamic> toJson() => _$AppUserToJson(this);
}

@freezed
abstract class UserProfileDTO with _$UserProfileDTO {
  const factory UserProfileDTO({
    required String name,
    required String email,
    String? profilePicture,
  }) = _UserProfileDTO;

  factory UserProfileDTO.fromJson(Map<String, Object?> json) =>
      _$UserProfileDTOFromJson(json);

  // @override
  // Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
