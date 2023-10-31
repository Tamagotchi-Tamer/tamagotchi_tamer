import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/cosmetic_db.dart';


final cosmeticDBProvider = Provider<CosmeticDB>((ref) {
  return CosmeticDB(ref);
});