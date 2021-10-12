import 'package:flutter/material.dart';

class SignupLoginTxt extends StatelessWidget {
  const SignupLoginTxt({
    Key? key,
    required this.txtToShow,
    required this.btnTxt,
    required this.btnHandler,
  }) : super(key: key);
  final String? txtToShow;
  final String? btnTxt;
  final VoidCallback btnHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(txtToShow!),
          GestureDetector(
            child: TextButton(
              child: Text(
                btnTxt!,
                style: TextStyle(
                  color: Colors.orange.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onPressed: btnHandler,
            ),
          ),
        ],
      ),
    );
  }
}
