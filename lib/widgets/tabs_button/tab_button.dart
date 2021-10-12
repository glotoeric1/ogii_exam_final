import 'package:flutter/material.dart';
import 'package:ogiiapp/screens/demande/demande_screen.dart';
import 'package:ogiiapp/screens/home/home_screen.dart';

class TabsScreenButton extends StatefulWidget {
  static const String routeName = "/demande";
  const TabsScreenButton({Key? key}) : super(key: key);

  @override
  _TabsScreenButtonState createState() => _TabsScreenButtonState();
}

class _TabsScreenButtonState extends State<TabsScreenButton> {
  List<Map<String, Widget>> _pages = [
    {
      'page': HomeScreenComponent(),
    },
    {
      'page': DemandeScreen(),
    },
  ];

  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Colors.orange.shade900,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.greenAccent,
        currentIndex: _selectedPageIndex,
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Dashbord',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Demande',
          ),
        ],
      ),
    );
  }
}
