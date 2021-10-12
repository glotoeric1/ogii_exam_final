import 'package:flutter/material.dart';

import '../../screens/login/component/body_login.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyLogin(),
    );
  }
}
