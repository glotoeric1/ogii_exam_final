import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
                      title: Text(doc['userPrenom'] + ' ' + doc['userNom']),
                      onTap: () {
                        setState(() {
                          delete(doc['phone']);
                        });
                      }),
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
