import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend.freezed.dart';
part 'friend.g.dart';

@Freezed()
class Friend with _$Friend {

  const factory Friend({
    required String id,
    required String name,
  }) = _User;

  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);

}