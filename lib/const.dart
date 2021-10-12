import 'package:flutter/material.dart';

const oPrimaryColor = Color(0xFFFF7643);
const oPrimaryLightColor = Color(0xFFFFECDF);

const oPrimaryGradientColor = LinearGradient(
  colors: [Color(0xFFFF7643), Color(0xFFFF7643)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const oSecondaryColor = Color(0xFF979797);
const oBorderColor = Colors.orange;
const oTextColor = Colors.black;

const oAnimationDuration = Duration(milliseconds: 200);

final RegExp emailValidattorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp firstNameValidattorRegExp = RegExp(r"^[a-zA-Z]+");
final RegExp lastNameValidattorRegExp = RegExp(r"^[a-zA-Z]+");
final RegExp phoneNumberValidattorRegExp = RegExp(r"^[0-9]+");

const String oEmailNullError = "Please Enter your email";
const String oInvalidEmailError = "Please Enter valid password";
const String oPassNullError = "Please Enter your password";
const String oShortPassError = "Password is too short";
const String oMatchNullError = "Passwords don't match";
const String oFirstNameNullError = "Please enter your firstname";
const String oLastNameNullError = "Please enter your Lastname";
const String oPhoneNullError = "Please enter your phone number";
const String oAddressNullError = "Please enter your address";
const String oInvalidFirstName = "Please enter a valid firstname";
const String oInvalidLastName = "Please enter a valid lastname";
const String oInvalidPhone = "Please enter a valid phone number";
