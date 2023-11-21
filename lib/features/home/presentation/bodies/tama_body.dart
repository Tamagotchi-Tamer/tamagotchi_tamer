import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../status.dart';

class TamaBody extends StatelessWidget {
  const TamaBody({super.key});

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/dojo.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          ),
        Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 33,
                  ),
                    Container(
                      child: Transform.rotate(
                        angle: -math.pi/2,
                        child: TextButton(
                          onPressed: () { Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Status())
                          );
                            }, child: Text(
                            'Status',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                            ),

                        ),
                      ),
                    ),
                  /*
                  Container(
                    child: Text(
                      "Middle Container",
                      style: TextStyle(

                      ),
                    ),
                  ),
                  */
                  Spacer(
                    flex: 1,
                  ),
                  Container(
                    child: Transform.rotate(
                      angle: -math.pi/2,
                      child: Text(
                          "Leaderboards",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 175,
            ),
            Image.asset("assets/tamagotchi/tama1.png"),
          ],
        ),
      ],
    );
  }
}