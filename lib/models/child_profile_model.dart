import 'package:freezed_annotation/freezed_annotation.dart';

part 'child_profile_model.freezed.dart';
part 'child_profile_model.g.dart';

@freezed
class ChildProfile with _$ChildProfile {
  const factory ChildProfile({
    required String name,
    required DateTime dateOfBirth,
    required String gender,
    required String relationship,
    String? photo,
    required String developmentStage,
  }) = _ChildProfile;

  factory ChildProfile.fromJson(Map<String, dynamic> json) => _$ChildProfileFromJson(json);
}
