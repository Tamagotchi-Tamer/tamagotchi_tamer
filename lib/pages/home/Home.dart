import 'package:flutter/material.dart';
import 'package:tamagotchi_tamer/pages/home/bodies/friends_body.dart';
import 'package:tamagotchi_tamer/pages/home/bodies/tama_body.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();

}


class _HomePageState extends State<HomePage>{

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
        'title': const Text('Friends'),
        'body': const FriendsBody(),
      },
      2: {
        'title': const Text('Other'),
        'body': Text("Index 2"),
      }
    };



    return Scaffold(
      appBar: AppBar(
        title: const Text("Tamagotchi Tamer"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search Button');
            },
          ),
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
            icon: Icon(Icons.people),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.adjust),
            label: 'Other',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

}