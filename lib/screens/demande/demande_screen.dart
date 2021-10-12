import 'package:flutter/material.dart';
import 'package:ogiiapp/screens/demande/components/body_demande.dart';

class DemandeScreen extends StatelessWidget {
  const DemandeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Les demandes"),
      ),
      body: DemandeBody(),
    );
  }
}
