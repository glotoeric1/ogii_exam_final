import 'package:flutter/material.dart';

import './components/body_acte.dart';

class ActeDeNaissance extends StatelessWidget {
  static const String routeName = "/acte_naissance";
  const ActeDeNaissance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acte de Naissance"),
      ),
      body: BodyActeDeNaissance(),
    );
  }
}
