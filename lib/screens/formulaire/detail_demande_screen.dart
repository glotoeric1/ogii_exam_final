import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailDemandeScreen extends StatefulWidget {
  static const String routeName = '/detail_demande_screen';
  DetailDemandeScreen({Key? key}) : super(key: key);

  @override
  _DetailDemandeScreenState createState() => _DetailDemandeScreenState();
}

class _DetailDemandeScreenState extends State<DetailDemandeScreen> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mairie'),
        centerTitle: true,
      ),
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
                          'A. N',
                        ),
                      ),
                    ),
                    title: Text(
                      'A Naissnce par : ${doc['userPrenom'] + ' ' + doc['userNom']}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange.shade900,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(doc['createdAt'].toDate()),
                      textAlign: TextAlign.center,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        //delete(doc[0].reference.id);

                        //docs[0].reference.id.toString()
                      },

                      /*
                      onPressed: () async {
                        await db
                            .collection('users')
                            .doc('olgKbONSO0FWKNSWXpc6')
                            .delete();
                      },*/
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
    QuerySnapshot querySnapshot;
    try {
      await db.collection("mairie").doc(id).delete();
      showAlertDialog(title: 'Sucess', message: id);
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
