import 'package:flutter/material.dart';
import 'package:selectable_container/selectable_container.dart';

class CompetitionBody extends StatefulWidget {
  const CompetitionBody({super.key});

  @override
  State<CompetitionBody> createState() => _CompetitionBody();

}

class _CompetitionBody extends State<CompetitionBody> {

  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 16.0, left: 24.0, right: 24.0),
          child: Row(
            children: [
              SelectableContainer(
                unselectedBackgroundColor: Color.fromRGBO(211, 145, 7, 0.5),
                selectedBackgroundColor: Color.fromRGBO(211, 145, 7, 0.6),
                unselectedBorderColor: Colors.black,
                selectedBorderColor: Colors.black,
                selected: _selected,
                  onValueChanged: (newValue){
                    setState((){
                      _selected = newValue;
                    });
                  },
                padding: 8.0,
                child: Container(
                  height: 150,
                  width: 150,
                  child:Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                        "Board Break",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              SelectableContainer(
                unselectedBorderColor: Colors.black,
                selectedBorderColor: Colors.black,
                selected: _selected,
                onValueChanged: (newValue){
                  setState((){
                    _selected = newValue;
                  });
                },
                padding: 8.0,
                child: Container(
                  height: 150,
                  width: 150,
                  child:Text(
                    "Selectable Container Sized"
                  ),
                ),
              ),
            ],


          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 24.0, left: 24.0, right: 24.0),
          child: Row(
            children: [
              SelectableContainer(
                unselectedBorderColor: Colors.black,
                selectedBorderColor: Colors.black,
                selected: _selected,
                onValueChanged: (newValue){
                  setState((){
                    _selected = newValue;
                  });
                },
                padding: 8.0,
                child: Container(
                  height: 150,
                  width: 150,
                  child:Text(
                      "Selectable Container Sized"
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              SelectableContainer(
                unselectedBorderColor: Colors.black,
                selectedBorderColor: Colors.black,
                selected: _selected,
                onValueChanged: (newValue){
                  setState((){
                    _selected = newValue;
                  });
                },
                padding: 8.0,
                child: Container(
                  height: 150,
                  width: 150,
                  child:Text(
                      "Selectable Container Sized"
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
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
            SelectableContainer(
              unselectedBackgroundColor: Color.fromRGBO(76, 175, 80, 0.5),
              //76, 175, 80
              selectedBackgroundColor: Color.fromRGBO(76, 175, 80, 0.8),


              unselectedBorderColor: Colors.black,
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
                      "VS Friend",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],

    );

  }
}
