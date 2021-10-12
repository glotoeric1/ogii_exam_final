import 'package:flutter/material.dart';

class TitleTxt extends StatelessWidget {
  const TitleTxt({Key? key, required this.titleTextShow}) : super(key: key);
  final String? titleTextShow;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        titleTextShow!,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.orange.shade900,
        ),
      ),
    );
  }
}
