import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamagotchi_tamer/features/home/presentation/bodies/competitions_body.dart';
import 'package:tamagotchi_tamer/features/home/presentation/bodies/fitness_body.dart';
import 'package:tamagotchi_tamer/features/home/presentation/bodies/friends_body.dart';
import 'package:tamagotchi_tamer/features/home/presentation/bodies/tama_body.dart';
import 'package:tamagotchi_tamer/features/users/domain/user.dart';
import 'package:tamagotchi_tamer/features/users/domain/user_collection.dart';
import 'package:tamagotchi_tamer/features/users/domain/user_db.dart';

import '../../all_data_provider.dart';
import '../../settings/presentation/settings_page.dart';
import '../../tt_error.dart';
import '../../tt_loading.dart';
import '../../users/data/user_providers.dart';
import 'bodies/shop_body.dart';


class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key,});

  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();

}


class _HomePageState extends ConsumerState<HomePage>{

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if(index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Widget build(BuildContext context) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) =>
            _build(
                context: context,
                currentUserID: allData.currentUserID,
                users: allData.users,
                ref: ref),
        loading: () => const TTLoading(),
        error: (e, st) => TTError(e.toString(), st.toString()));
  }

  Widget _build({required BuildContext context, required String currentUserID, required List<User> users, required WidgetRef ref}) {
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
        'body': FriendsBody(),
      },
      4: {
        'title': const Text("Fitness"),
        'body': FitnessBody(),
      }
    };


    UserCollection userCollection = UserCollection(users);

    return Scaffold(
      appBar: AppBar(
        title: Transform(
          transform: Matrix4.translationValues(-130.0, 0.0, 0.0),
          child: Text(
            userCollection.getUser(currentUserID).username,
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
              Navigator.of(context).pushNamed(
                SettingsPage.routeName
              ).then((_) => setState(() {}));
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