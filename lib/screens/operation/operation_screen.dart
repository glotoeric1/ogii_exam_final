import 'package:flutter/material.dart';

import './component/body_operation.dart';

class OperationScreen extends StatelessWidget {
  static const routeName = "/operation";
  const OperationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Des operations"),
      ),
      body: BodyOperation(),
    );
  }
}
