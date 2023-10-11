import 'package:flutter/material.dart';
import 'package:tamagotchi_tamer/pages/home/bodies/competitions_body.dart';
import 'package:tamagotchi_tamer/pages/home/bodies/fitness_body.dart';
import 'package:tamagotchi_tamer/pages/home/bodies/friends_body.dart';
import 'package:tamagotchi_tamer/pages/home/bodies/tama_body.dart';
import 'package:tamagotchi_tamer/data_model/user_db.dart';

import 'bodies/shop_body.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();

}


class _HomePageState extends State<HomePage>{



  //UserData userID = userDB.getUser(currentUserID);

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if(index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }



  Widget build(BuildContext context) {

    final Map pages = {
      0: {
        'title': const Text("Home"),
        'body': const TamaBody(),
        //Tama body is where the tamagotchi is along with most of the animations as well
      },
      1:{
        'title': const Text('Shop'),
        'body': const ShopBody(),
      },
      2: {
        'title': const Text('Competition'),
        'body': CompetitionBody(),
      },
      3: {
        'title': const Text("Friends"),
        'body': FriendsBody(userID: currentUserID,),
      },
      4: {
        'title': const Text("Fitness"),
        'body': FitnessBody(),
      }
    };



    return Scaffold(
      appBar: AppBar(
        title: Transform(
          transform: Matrix4.translationValues(-110.0, 0.0, 0.0),
          child: const Text(
            "Tamagotchi Tamer",
            style: TextStyle(
              color: Colors.white,
            )
          )
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
            Icons.tune,
              semanticLabel: 'filter',
          ),
            onPressed: () {
              print('Filter button');
            }
          )
        ],
      ),
      body: pages[_selectedIndex]['body'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.warning),
              label: 'Competition'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Friends'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.adjust),
            label: 'Fitness',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

}