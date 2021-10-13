import 'package:flutter/material.dart';
import 'package:ogiiapp/screens/formulaire/detail_demande_screen.dart';
import 'package:ogiiapp/screens/signup/components/users_detail.dart';

import '../../screens/formulaire/acte_screen.dart';

class MainDrawer extends StatelessWidget {
  static const String snackBarTxt = "Sera disponible bientôt";
  const MainDrawer({Key? key}) : super(key: key);

  Widget listTileBuilder(
      {String? listTitle, IconData? listIcon, VoidCallback? onPressHandler}) {
    return ListTile(
      leading: Icon(
        listIcon,
        size: 26,
      ),
      title: Text(
        listTitle!,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onPressHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    // ScaffoldState sState = Scaffold.of(context);

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(30),
            alignment: Alignment.centerLeft,
            color: Colors.orange.shade900,
            child: Text(
              "Ogii Dashboard",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          listTileBuilder(
            listTitle: "Acte de Naissance",
            listIcon: Icons.child_care,
            onPressHandler: () {
              Navigator.pushNamed(context, ActeDeNaissance.routeName);
            },
          ),
          listTileBuilder(
            listTitle: "Les Demandes",
            listIcon: Icons.approval,
            onPressHandler: () {
              Navigator.pushNamed(context, DetailDemandeScreen.routeName);
            },
          ),
          listTileBuilder(
            listTitle: "Utilisateurs",
            listIcon: Icons.account_circle,
            onPressHandler: () {
              Navigator.pushNamed(context, UsersList.routeName);
            },
          ),
          listTileBuilder(
            listTitle: "Certifications",
            listIcon: Icons.policy,
            onPressHandler: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(snackBarTxt),
                ),
              );
            },
          ),
          listTileBuilder(
            listTitle: "Parameters",
            listIcon: Icons.settings,
            onPressHandler: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(snackBarTxt),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
