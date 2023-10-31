import 'package:flutter/material.dart';
import 'package:tamagotchi_tamer/features/shop/presentation/cosmetics_page.dart';
import 'package:tamagotchi_tamer/features/shop/presentation/tamagotchi_page.dart';

class ShopBody extends StatelessWidget {
  const ShopBody({super.key});



  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TamaShopPage())
                );
              },
              child: Text(
                  "Tamagotchi",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(240, 80)
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cosmetics())
                );
              },
              child: Text(
                  "Cosmetics",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(240, 80)
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
              onPressed: () {

              },
              child: Text(
                  "Power-Ups",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(240, 80)
            ),
          )
        ],

      ),
    );
  }
}
