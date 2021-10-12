import 'package:flutter/material.dart';

class SubTitleText extends StatelessWidget {
  const SubTitleText({Key? key, required this.subTitleTextShow})
      : super(key: key);
  final String? subTitleTextShow;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        subTitleTextShow!,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
