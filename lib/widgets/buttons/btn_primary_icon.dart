import 'package:flutter/material.dart';
//import '/const.dart';

class BtnPrimaryIcon extends StatelessWidget {
  BtnPrimaryIcon({
    Key? key,
    this.btnText,
    this.btnOnPressAction,
    this.btnIcon,
  }) : super(key: key);

  final String? btnText;
  final VoidCallback? btnOnPressAction;
  final Color btnColor = Colors.orange.shade900;
  final IconData? btnIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: btnOnPressAction,
        icon: Icon(btnIcon),
        label: Text(
          btnText!,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: btnColor,
        ),
      ),
    );
  }
}
