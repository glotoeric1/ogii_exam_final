import 'package:flutter/widgets.dart';
import 'package:ogiiapp/screens/formulaire/acte_screen.dart';
import 'package:ogiiapp/screens/formulaire/autre_screen.dart';
import 'package:ogiiapp/screens/formulaire/detail_demande_screen.dart';
import 'package:ogiiapp/screens/signup/components/users_detail.dart';
import 'package:ogiiapp/screens/tab_screens/tab_screen.dart';
import 'package:ogiiapp/widgets/tabs_button/tab_button.dart';
//import 'package:ogiiapp/screens/formulaire/components/body_autre.dart';

import '../../screens/operation/operation_screen.dart';
import '../../screens/signup/signup_screen.dart';
import '../../screens/login/login_screen.dart';
import '../../screens/home/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreenComponent.routeName: (ctx) => HomeScreenComponent(),
  LoginScreen.routeName: (ctx) => LoginScreen(),
  SignupScreen.routeName: (ctx) => SignupScreen(),
  OperationScreen.routeName: (ctx) => OperationScreen(),
  ActeDeNaissance.routeName: (ctx) => ActeDeNaissance(),
  AutreOperation.routeName: (ctx) => AutreOperation(),
  TabScreenMain.routeName: (ctx) => TabScreenMain(),
  TabsScreenButton.routeName: (ctx) => TabsScreenButton(),
  UsersList.routeName: (ctx) => UsersList(),
  DetailDemandeScreen.routeName: (ctx) => DetailDemandeScreen(),
};
