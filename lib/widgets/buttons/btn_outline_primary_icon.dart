import 'package:flutter/material.dart';
//import '/const.dart';

class BtnOutLinePrimaryIcon extends StatelessWidget {
  BtnOutLinePrimaryIcon(
      {Key? key, this.btnText, this.btnOnPressAction, this.btnIcon})
      : super(key: key);

  final String? btnText;
  final VoidCallback? btnOnPressAction;
  final Color btnColor = Colors.orange.shade900;
  final IconData? btnIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        onPressed: btnOnPressAction,
        icon: Icon(btnIcon, color: btnColor),
        label: Text(
          btnText!,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: btnColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          side: BorderSide(color: btnColor, width: 3.0),
        ),
      ),
    );
  }
}
