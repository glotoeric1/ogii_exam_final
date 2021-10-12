import 'package:flutter/material.dart';
import 'package:ogiiapp/screens/demande/demande_screen.dart';
import 'package:ogiiapp/screens/home/home_screen.dart';

class TabScreenMain extends StatefulWidget {
  static const String routeName = "/tab_screen";
  const TabScreenMain({Key? key}) : super(key: key);

  @override
  _TabScreenMainState createState() => _TabScreenMainState();
}

class _TabScreenMainState extends State<TabScreenMain> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meal'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.category), text: 'Dashbord'),
              Tab(icon: Icon(Icons.star), text: 'Demande'),
            ],
          ),
        ),
        body: TabBarView(children: [
          HomeScreenComponent(),
          DemandeScreen(),
        ]),
      ),
    );
  }
}
