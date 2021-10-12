import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final String? showTxt;
  final VoidCallback? btnHandler;
  final IconData? iconData;
  final IconData? iconDataTrailing;

  const CustomGridView({
    Key? key,
    required this.showTxt,
    required this.btnHandler,
    required this.iconData,
    this.iconDataTrailing = Icons.keyboard_arrow_right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10),
      elevation: 5,
      child: ListTile(
        leading: Icon(iconData),
        trailing: Icon(Icons.keyboard_arrow_right),
        title: TextButton(
          child: Text(
            showTxt!,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.orange.shade900,
            ),
          ),
          onPressed: btnHandler,
        ),
      ),
    );
  }
}
