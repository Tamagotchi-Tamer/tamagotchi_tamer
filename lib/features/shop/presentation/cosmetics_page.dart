import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamagotchi_tamer/features/shop/domain/cosmetic_db.dart';

import '../data/cosmetic_providers.dart';

class Cosmetics extends ConsumerWidget {



  static const routeName = '/cosmetics';

  Cosmetics({super.key});

  late CosmeticDB cosmeticDB;

  List<Card> _buildGridCards(BuildContext context) {
    List<CosmeticData> cosmeticsList =  cosmeticDB.getAllCosmetics();

    if (cosmeticsList.isEmpty) {
      return const <Card>[];
    }

    return cosmeticsList.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(
              flex: 1
            ),
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.contain,
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    product.value.toString(),
                    textAlign: TextAlign.center,
                  ),
                  //Also include an icon
                  Spacer(
                    flex: 1
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    cosmeticDB = ref.read(cosmeticDBProvider);


    return Scaffold(
      appBar: AppBar(
        title: Text("Cosmetics"),

      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(64.0),
              child: Container(
                height: 250,
                child: const Text(
                  "Tamagotchi Staging Area",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),


              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.all(16.0),
                childAspectRatio: 8.0/9.0,
                children: _buildGridCards(context),
              ),
            )

          ],
        ),
      )
    );
  }

}