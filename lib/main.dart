import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ogiiapp/base_theme.dart';
//import 'package:ogiiapp/screens/home/home_screen.dart';
import 'package:ogiiapp/screens/login/login_screen.dart';
import './routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ogii App',
      theme: customTheme(),

      /*
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.lightGreenAccent,
      ),
      */
      initialRoute: LoginScreen.routeName,
      routes: routes,
    );
  }
}
