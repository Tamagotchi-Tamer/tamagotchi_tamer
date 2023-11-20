import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed()
class User with _$User {

  const factory User({
    required String id,
    required String name,
    required String username,
    required String email,
    String? imagePath,
    required String initials,
}) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}