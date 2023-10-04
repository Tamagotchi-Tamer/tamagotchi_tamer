import 'package:flutter/material.dart';
import 'package:tamagotchi_tamer/components/fitness/day_graph.dart';
import 'package:tamagotchi_tamer/components/fitness/week_graph.dart';

enum SelectedTime { day, week, month, year}

extension SelectedTimeValue on SelectedTime {
  int get number {
    switch (this) {
      case SelectedTime.day:
        return 0;
      case SelectedTime.week:
        return 1;
      case SelectedTime.month:
        return 2;
      case SelectedTime.year:
        return 3;
    }
  }
}
//This extension allows us to get an int value from an associated enum

class FitnessBody extends StatefulWidget {

  const FitnessBody({super.key,});

  @override
  State<FitnessBody> createState() => _FitnessBodyState();
}

class _FitnessBodyState extends State<FitnessBody>{

  final List<bool> _selectedTime= <bool>[true, false, false, false];

  bool vertical = false;

  late int index = 0;

  SelectedTime currentTime = SelectedTime.day;

  List<Widget> timePeriod = <Widget>[
    Text("D"),
    Text("W"),
    Text("M"),
    Text("Y"),
  ];

  List<Widget> graphs = <Widget>[
    CreateDayGraph(),
    CreateGraphWeek(),
    Text("Month Graph"),
    Text("Year Graph"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ToggleButtons(
                    direction: vertical ? Axis.vertical : Axis.horizontal,
                    onPressed: (index) {
                      setState(() {
                        // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < _selectedTime.length; i++) {
                          _selectedTime[i] = i == index;
                        }
                        //Above code is required for button switching functionality


                        currentTime = SelectedTime.values[index];
                        //Above line changes the local enum value associated with the index


                      });
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    selectedBorderColor: Colors.red[700],
                    selectedColor: Colors.white,
                    fillColor: Colors.red[200],
                    color: Colors.red[400],
                    constraints: const BoxConstraints(
                      minHeight: 45.0,
                      minWidth: 90.0,
                    ),
                    isSelected: _selectedTime,
                    children: timePeriod,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
              ]
          ),
          graphs[currentTime.number],
        ],
      ),
    );
  }

}
