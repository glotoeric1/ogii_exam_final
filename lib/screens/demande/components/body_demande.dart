import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DemandeBody extends StatefulWidget {
  DemandeBody({Key? key}) : super(key: key);

  @override
  _DemandeBodyState createState() => _DemandeBodyState();
}

class _DemandeBodyState extends State<DemandeBody> {
  final db = FirebaseFirestore.instance;
  var snackBarTxt = 'Une notification envoye';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('mairie').snapshots(),
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
                        child: Text(
                            DateFormat.MMM().format(doc['createdAt'].toDate())),
                      ),
                    ),
                    title: Text(
                      doc['userPrenom'] + ' ' + doc['userNom'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
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
                      icon: const Icon(Icons.access_alarm),
                      color: Colors.green,
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

  Future<void> delete(String id) async {
    try {
      await db.collection("mairie").doc(id).delete();
      showAlertDialog(title: 'Sucess', message: 'Avec sucess');
    } catch (e) {
      showAlertDialog(title: 'Erreur', message: 'Erreur de suprission ');
    }
  }

  void showAlertDialog({String? title, String? message}) {
    AlertDialog alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text(
        title!,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.green.shade700,
        ),
      ),
      content: Text(
        message!,
        textAlign: TextAlign.center,
      ),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
