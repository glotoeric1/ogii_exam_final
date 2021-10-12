import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:ogiiapp/database/user_database.dart';
//import 'package:ogiiapp/models/users_database.dart';
//import 'package:ogiiapp/models/users_model.dart';
//import 'package:ogiiapp/widgets/gridview/grid_view.dart';
//import 'package:sqflite/sqlite_api.dart';

class UsersList extends StatelessWidget {
  static const String routeName = "/user_details";
  UsersList({Key? key}) : super(key: key);

  //UserDatabase? db;
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return Card(
                  child: ListTile(
                    title: Text(doc['prenom'] + ' ' + doc['nom']),
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}
