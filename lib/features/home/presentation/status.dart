import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Status extends StatelessWidget {


  static const routeName = '/status';

  const Status({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      ),
      body: SafeArea(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            height: 150,
                            width: 150,
                            child: Image.asset('assets/tamagotchi/tama1.png')
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        const Column(
                          children: [
                            Text(
                                'Name Text',
                              //Would be nice if I could get a text wrap here for longer names but seeing as I can't I'll just limit character names
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 28,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                                'Date Text',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18
                              ),
                            ),
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                      child: Text(
                        'Fitness Meter',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        LinearPercentIndicator(
                          width: 370,
                          lineHeight: 32.0,
                          percent: 0.7,
                          progressColor: Colors.pinkAccent,
                          barRadius: const Radius.circular(16),
                          animation: true,
                          animationDuration: 800,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                      child: Text(
                        'Attributes',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Strength',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          LinearPercentIndicator(
                            width: 300,
                            lineHeight: 16,
                            percent: 0.9,
                            progressColor: Colors.red,
                            barRadius: const Radius.circular(16),
                            animation: true,
                            animationDuration: 800,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Speed',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          LinearPercentIndicator(
                            width: 300,
                            lineHeight: 16,
                            percent: 0.3,
                            progressColor: Colors.blue,
                            barRadius: const Radius.circular(16),
                            animation: true,
                            animationDuration: 800,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Stamina',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          LinearPercentIndicator(
                            width: 300,
                            lineHeight: 16,
                            percent: 0.7,
                            progressColor: Colors.green,
                            barRadius: const Radius.circular(16),
                            animation: true,
                            animationDuration: 800,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],

          ),
      ),

    );
  }

}