import 'package:flutter/material.dart';

import '../../../screens/formulaire/acte_screen.dart';
import '../../../widgets/gridview/grid_view.dart';
//import 'package:ogiiapp/screens/formulaire/acte_screen.dart';

class BodyOperation extends StatelessWidget {
  const BodyOperation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView(
        children: [
          CustomGridView(
            iconData: Icons.file_copy,
            showTxt: "Acte de Naissance",
            btnHandler: () {
              Navigator.pushNamed(context, ActeDeNaissance.routeName);
            },
          ),
          CustomGridView(
            iconData: Icons.file_copy,
            showTxt: "Certification de diplome",
            btnHandler: () {},
          ),
        ],
      ),
    );
  }
}
