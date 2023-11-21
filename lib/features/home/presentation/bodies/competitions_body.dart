import 'package:flutter/material.dart';
import 'package:selectable_container/selectable_container.dart';
import 'package:tamagotchi_tamer/features/global_snackbar.dart';

class CompetitionBody extends StatefulWidget {
  const CompetitionBody({super.key});

  @override
  State<CompetitionBody> createState() => _CompetitionBody();

}

class _CompetitionBody extends State<CompetitionBody> {

  bool _selected = false;
  bool _bbselected = false;
  bool _rselected = false;
  bool _hjselected = false;
  bool _sbbselected = false;

  alreadySelected() {
    if((_bbselected || _rselected || _hjselected || _sbbselected) == true) {
      _bbselected = false;
      _rselected = false;
      _hjselected = false;
      _sbbselected = false;
    }
    return;
  }

  bool anySelected() {
    if((_bbselected || _rselected || _hjselected || _sbbselected) == true) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Center(
            child: SelectableContainer(
              unselectedBackgroundColor: Color.fromRGBO(255, 0, 0, 0.5),
              selectedBackgroundColor: Color.fromRGBO(255, 0, 0, 0.6),
              unselectedBorderColor: Colors.black,
              selectedBorderColor: Colors.black,
              selected: _bbselected,
                onValueChanged: (newValue){
                  setState((){
                    alreadySelected();
                    _bbselected = newValue;
                  });
                },
              padding: 8.0,
              child: Container(
                width: 350,
                height: 75,
                child:const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                      "Board Break",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SelectableContainer(
              unselectedBackgroundColor: Color.fromRGBO(255, 255, 0, 0.5),
              selectedBackgroundColor: Color.fromRGBO(255, 255, 0, 0.6),
              unselectedBorderColor: Colors.black,
              selectedBorderColor: Colors.black,
              selected: _rselected,
              onValueChanged: (newValue){
                setState((){
                  alreadySelected();
                  _rselected = newValue;
                });
              },
              padding: 8.0,
              child: Container(
                width: 350,
                height: 75,
                child:const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    "Running",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SelectableContainer(
              unselectedBackgroundColor: Color.fromRGBO(255, 165, 0, 0.5),
              selectedBackgroundColor: Color.fromRGBO(255, 165, 0, 0.6),
              unselectedBorderColor: Colors.black,
              selectedBorderColor: Colors.black,
              selected: _hjselected,
              onValueChanged: (newValue){
                setState((){
                  alreadySelected();
                  _hjselected = newValue;
                });
              },
              padding: 8.0,
              child: Container(
                width: 350,
                height: 75,
                child:const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    "High Jump",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SelectableContainer(
              unselectedBackgroundColor: Color.fromRGBO(0, 0, 255, 0.5),
              selectedBackgroundColor: Color.fromRGBO(0, 0, 255, 0.6),
              unselectedBorderColor: Colors.black,
              selectedBorderColor: Colors.black,
              selected: _sbbselected,
              onValueChanged: (newValue){
                setState((){
                  alreadySelected();
                  _sbbselected = newValue;
                });
              },
              padding: 8.0,
              child: Container(
                width: 350,
                height: 75,
                child:const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    "Speed Board Break",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                /*
                SelectableContainer(
                  unselectedBorderColor: Colors.black,
                  unselectedBackgroundColor: Color.fromRGBO(255, 82, 82, 0.5),
                  selectedBackgroundColor: Color.fromRGBO(255, 82, 82, 0.8),
                  selectedBorderColor: Colors.black,
                  selected: _selected,
                   onValueChanged: (newValue){
                     setState((){
                       _selected = newValue;
                     });
                   },
                   padding: 8.0,
                   child: Container(
                     height: 80,
                     width: 350,
                     child: Padding(
                       padding: const EdgeInsets.all(24.0),
                       child: Text(
                           "VS Other",
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           fontSize: 36,
                         ),
                       ),
                     ),
                   ),
                 ),
                 */
                SelectableContainer(
                  unselectedBackgroundColor: Color.fromRGBO(76, 175, 80, 0.8),
                  //76, 175, 80
                  selectedBackgroundColor: Color.fromRGBO(76, 175, 80, 0.8),


                  unselectedBorderColor: Colors.black,
                  selectedBorderColor: Colors.black,
                  selected: _selected,
                  onValueChanged: (newValue){
                    setState(() {
                      if(anySelected() == false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please select an activity"))
                        );
                      } else {
                        _selected = newValue;
                      }
                    });
                  },
                  padding: 8.0,
                  child: Container(
                    height: 80,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(
                          "Compete",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],

      ),
    );

  }
}
