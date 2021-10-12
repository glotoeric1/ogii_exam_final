import 'package:flutter/material.dart';
import 'package:ogiiapp/screens/formulaire/components/body_autre.dart';

class AutreOperation extends StatelessWidget {
  static const String routeName = "/autre_naissance";
  const AutreOperation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Autre Demande"),
      ),
      body: AutreDemande(),
    );
  }
}
