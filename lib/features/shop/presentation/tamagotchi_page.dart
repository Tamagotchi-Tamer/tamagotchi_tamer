import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class TamaShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tamagotchi Shop"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    Image.asset("assets/tamagotchi/pika_tama_test.png"),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(160, 80)
                        ),
                          onPressed: () {

                          },
                          child: Text(
                              "1000 coins"
                          )
                      ),
                    ),
                  ],
                )
              ),

              //2nd Image of Slider
              Container(
                  margin: EdgeInsets.all(6.0),
                  child: Image.asset("assets/tamagotchi/eevee_tama_test.png")
              ),

              //3rd Image of Slider
              Container(
                  margin: EdgeInsets.all(6.0),
                  child: Image.asset("assets/tamagotchi/squirtle_tama_test.jpg")
              ),

              //4th Image of Slider
              Container(
                  margin: EdgeInsets.all(6.0),
                  child: Image.asset("assets/tamagotchi/bulbasaur_tama_test.png")
              ),

              //5th Image of Slider
              Container(
                  margin: EdgeInsets.all(6.0),
                  child: Image.asset("assets/tamagotchi/charmander_tama_test.png")
              ),

            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 360.0,
              enlargeCenterPage: false,
              autoPlay: false,
              aspectRatio: 16/9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
                "Test text field below carousel",
            ),
          ),
        ],
      ),

    );
  }

}