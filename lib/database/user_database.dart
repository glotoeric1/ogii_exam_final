import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';

class UserDatabase {
  FirebaseFirestore? firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> create(
    String prenom,
    String nom,
    String phone,
    String address,
    String email,
    String passwords,
  ) async {
    try {
      await firestore!.collection("users").add({
        'prenom': prenom,
        'nom': nom,
        'phone': phone,
        'address': address,
        'email': email,
        'passwords': passwords,
        'isAdmin': 2,
        'createdAt': FieldValue.serverTimestamp()
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore!.collection("users").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<List?> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot =
          await firestore!.collection('users').orderBy('timestamp').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"id": doc.id, "prenom": doc['prenom'], "nom": doc["nom"]};
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> update(
    String id,
    String prenom,
    String nom,
    String phone,
    String address,
    String email,
    String passwords,
    String isAdmin,
  ) async {
    try {
      await firestore!.collection("users").doc(id).update({
        'prenom': prenom,
        'nom': nom,
        'phone': phone,
        'address': address,
        'email': email,
        'isAdmin': isAdmin,
      });
    } catch (e) {
      print(e);
    }
  }
}
