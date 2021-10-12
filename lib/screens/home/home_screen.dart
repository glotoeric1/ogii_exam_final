import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../screens/home/component/body_screen_component.dart';
import '../../widgets/drawer/drawer_nav.dart';

class HomeScreenComponent extends StatefulWidget {
  static const routeName = '/home';
  HomeScreenComponent({Key? key}) : super(key: key);

  @override
  _HomeScreenComponentState createState() => _HomeScreenComponentState();
}

class _HomeScreenComponentState extends State<HomeScreenComponent> {
  FirebaseFirestore? firestore;
  bool userCheck = true;

  initiliaze() {
    firestore = FirebaseFirestore.instance;
  }

  @override
  void initState() {
    super.initState();
    initiliaze();
    checkAdminLevel('gloto@com', 'abc');
  }

  @override
  Widget build(BuildContext context) {
    /*
    final routesArges =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final userEmail = routesArges['email'];
   
    final userPass = routesArges['pass'];
     */

    Widget? drawer = userCheck
        ? MainDrawer()
        : Column(
            children: [
              Container(
                height: 120,
                width: double.infinity,
                padding: EdgeInsets.all(30),
                alignment: Alignment.centerLeft,
                color: Colors.orange.shade900,
                child: Text(
                  "Dashboard",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Cette option est disponible unquement pour super admin",
                ),
              )
            ],
          );
    return Scaffold(
      appBar: AppBar(
        title: Text('Ogii Dashboard'),
      ),
      drawer: drawer,
      body: BodyScreenComponent(),
    );
  }

  Future<String?> checkAdminLevel(String email, String pass) async {
    QuerySnapshot querySnapshot;
    try {
      querySnapshot = await firestore!
          .collection('users')
          .where('email', isEqualTo: email)
          .where('passwords', isEqualTo: pass)
          .where('isAdmin', isEqualTo: 1)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        userCheck = true;
      }
    } catch (e) {
      print('Erreur : $e');
    }
  }
}
