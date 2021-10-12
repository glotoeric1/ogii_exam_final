import 'package:flutter/material.dart';
//import '/const.dart';

class BtnPrimary extends StatelessWidget {
  BtnPrimary({
    Key? key,
    this.btnText,
    this.btnOnPressAction,
  }) : super(key: key);

  final String? btnText;
  final VoidCallback? btnOnPressAction;
  final Color btnColor = Colors.orange.shade900;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: btnOnPressAction,
        child: Text(
          btnText!,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          primary: btnColor,
          shape: StadiumBorder(),
        ),
      ),
    );
  }
}
