import 'package:flutter/material.dart';

import './components/body_signup.dart';

class SignupScreen extends StatelessWidget {
  static const routeName = "/signup";
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('S\'inscrire'),
      ),
      body: BodySignup(),
    );
  }
}
