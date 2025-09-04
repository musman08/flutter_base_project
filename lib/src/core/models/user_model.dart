import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class AppUser with _$AppUser {
  const factory AppUser({
    required String userId,
    required UserProfile profile,
  }) = _AppUser;

  // factory AppUser.fromJson(Map<String, Object?> json) =>
  //     _$AppUserFromJson(json);

  // @override
  // Map<String, dynamic> toJson() => _$AppUserToJson(this);
}

@Freezed(toJson: false, fromJson: false)
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String name,
    required String email,
    String? profilePicture,
  }) = _UserProfile;

  // factory UserProfile.fromJson(Map<String, Object?> json) =>
  //     _$UserProfileFromJson(json);

  // @override
  // Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
