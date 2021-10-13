import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  var snackBarTxt = "l'access Non autorizer";

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
                  elevation: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.orange.shade900,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text('User'),
                      ),
                    ),
                    title: Text(
                      doc['prenom'] + ' ' + doc['nom'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange.shade900,
                      ),
                    ),
                    subtitle: Text(
                      //doc['createdAt'],
                      DateFormat.yMMMMd().format(doc['createdAt'].toDate()),
                      textAlign: TextAlign.center,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(snackBarTxt),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}
