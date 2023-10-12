
class CosmeticData {

  CosmeticData(
      {required this.ID,
        required this.name,
        required this.imagePath,
        required this.value,
      });

  int ID;
  String name;
  String imagePath;
  int value;


}

class CosmeticDB {
  final List<CosmeticData> cosmetics = [
    CosmeticData(
        ID: 10,
        name: "Santa Hat",
        imagePath: 'assets/cosmetics/santa_hat.png',
        value: 200,
    ),
    CosmeticData(
        ID: 11,
        name: "Baseball Cap",
        imagePath: 'assets/cosmetics/baseball_cap.png',
        value: 150
    ),
    CosmeticData(
        ID: 12,
        name: "Headphones",
        imagePath: 'assets/cosmetics/headphones.png',
        value: 200
    ),
    CosmeticData(
        ID: 13,
        name: "Beanie",
        imagePath: 'assets/cosmetics/beanie.png',
        value: 150
    ),
  ];

  List<CosmeticData> getAllCosmetics() {
    return cosmetics;
  }


}

/// The singleton instance of a cosmeticDB used by clients to access cosmetic data.
CosmeticDB cosmeticDB = CosmeticDB();