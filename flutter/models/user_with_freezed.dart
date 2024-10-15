import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {
  const factory User.valid({
    required String id,
    required String token,
    required String name,
    required String email,
    required String phone,
    required String dateOfBirth,
    required String imageUrl,
  }) = ValidUser;

  const factory User.invalid() = InvalidUser;
  const factory User.unknown() = UnknownUser;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
