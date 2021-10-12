import 'package:flutter/material.dart';
//import '/const.dart';

class BtnOutLinePrimary extends StatelessWidget {
  BtnOutLinePrimary({
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
      child: OutlinedButton(
        onPressed: btnOnPressAction,
        child: Text(
          btnText!,
          style: TextStyle(
              fontSize: 16, color: btnColor, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          side: BorderSide(color: btnColor, width: 3.0),
          /*
          shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: btnColor, width: 2.0),
          ),
          */
        ),
      ),
    );
  }
}
