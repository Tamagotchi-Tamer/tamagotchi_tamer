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
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              SelectableContainer(
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
        Row(),
        Column(
          children: [
            Stack(
              children: [
                 Align(
                   alignment: Alignment.bottomCenter,
                   child: SelectableContainer(
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
                        child: Text(
                            "VS Other"
                        ),
                      ),
                    ),
                 ),
              ],
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SelectableContainer(
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
                      child: Text(
                          "VS Friend"
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],

    );

  }
}
