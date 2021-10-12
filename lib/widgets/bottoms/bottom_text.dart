import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  const BottomText({Key? key, required this.bottomTextShow}) : super(key: key);
  final String? bottomTextShow;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        bottomTextShow!,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
