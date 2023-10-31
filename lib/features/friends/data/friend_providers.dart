import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/friend_db.dart';

final friendDBProvider = Provider<FriendDB>((ref) {
  return FriendDB(ref);
});