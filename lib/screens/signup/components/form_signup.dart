/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:ogiiapp/models/users.dart';
import 'package:ogiiapp/screens/login/login_screen.dart';
import 'package:ogiiapp/screens/signup/components/users_detail.dart';
import 'package:ogiiapp/widgets/bottoms/signup_login_txt.dart';
import 'package:ogiiapp/widgets/buttons/btn_primary_icon.dart';

import '../../../const.dart';
import '../../../database/user_database.dart';

class FormSignup extends StatefulWidget {
  FormSignup({Key? key}) : super(key: key);

  @override
  _FormSignupState createState() => _FormSignupState();
}

class _FormSignupState extends State<FormSignup> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? userEmail = new TextEditingController();
  TextEditingController? userPassword = new TextEditingController();
  TextEditingController? userPhone = new TextEditingController();
  TextEditingController? userAddresse = new TextEditingController();
  TextEditingController? userFirstName = new TextEditingController();
  TextEditingController? userLastName = new TextEditingController();

  FirebaseFirestore firestore;
  initiliaze() {
    firestore = FirebaseFirestore.instance;
  }

  UserDatabase db;
  initilialize() {
    db = UserDatabase();
    db.initiliase();
  }

  @override
  void initState() {
    super.initState();
    initiliase();
  }

  Users? users;

  final List<String> errors = [];

  void addErr({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeErr({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 10),
          userFirstnameField(),
          SizedBox(height: 10),
          userLastField(),
          SizedBox(height: 10),
          userAddressField(),
          SizedBox(height: 10),
          userPhoneField(),
          SizedBox(height: 10),
          userEmailField(),
          SizedBox(height: 10),
          userPasswordField(),
          SizedBox(height: 15),
          BtnPrimaryIcon(
            btnIcon: Icons.login,
            btnText: ('Signup'),
            btnOnPressAction: () {
              ///addOrUpdateUser;
              tcreate();
              print(userAddresse!.text);
              print(userFirstName!.text);
              print(userLastName!.text);
              print(userEmail!.text);
              print(userPassword!.text);
              print(userPhone!.text);
            },
          ),
          SizedBox(height: 20),
          SignupLoginTxt(
            txtToShow: "J'a deja un compte ",
            btnTxt: "Se connecter",
            btnHandler: () {
              Navigator.pushNamed(context, LoginScreen.routeName);
            },
          ),
          SizedBox(height: 10),
          SignupLoginTxt(
            txtToShow: "See users",
            btnTxt: "See",
            btnHandler: () {
              Navigator.pushNamed(context, UsersList.routeName);
            },
          ),
        ],
      ),
    );
  }

  TextFormField userEmailField() {
    return TextFormField(
      controller: userEmail!,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => userEmail = newValue as TextEditingController?,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeErr(error: oEmailNullError);
        } else if (emailValidattorRegExp.hasMatch(value)) {
          removeErr(error: oInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addErr(error: oEmailNullError);
          return '';
        } else if (!emailValidattorRegExp.hasMatch(value)) {
          addErr(error: oInvalidEmailError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Saisissez votre email',
        labelStyle: TextStyle(color: oBorderColor),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  TextFormField userPasswordField() {
    return TextFormField(
      controller: userPassword,
      obscureText: true,
      onSaved: (newValue) => userPassword = newValue as TextEditingController?,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeErr(error: oPassNullError);
        } else if (value.length >= 4) {
          removeErr(error: oShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addErr(error: oPassNullError);
          return '';
        } else if (value.length < 4) {
          addErr(error: oShortPassError);
          return '';
        }
        userPassword = value as TextEditingController?;
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Saisissez votre mot de passe',
        labelStyle: TextStyle(color: oBorderColor),

        //prefixStyle: TextStyle(color: Colors.red),
        //hintStyle: TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  TextFormField userPhoneField() {
    return TextFormField(
      controller: userPhone,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => userPhone = newValue as TextEditingController?,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeErr(error: oPhoneNullError);
        } else if (value.length == 8) {
          removeErr(error: oShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addErr(error: oPhoneNullError);
          return '';
        } else if (value.length != 8) {
          addErr(error: oInvalidPhone);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Phone',
        hintText: 'Saisissez votre Contact',
        labelStyle: TextStyle(color: oBorderColor),

        //prefixStyle: TextStyle(color: Colors.red),
        //hintStyle: TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  TextFormField userAddressField() {
    return TextFormField(
      controller: userAddresse,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => userAddresse = newValue as TextEditingController?,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeErr(error: oAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addErr(error: oAddressNullError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Adresse',
        hintText: 'Saisissez votre adresse',
        labelStyle: TextStyle(color: oBorderColor),

        //prefixStyle: TextStyle(color: Colors.red),
        //hintStyle: TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  TextFormField userLastField() {
    return TextFormField(
      controller: userLastName,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => userLastName = newValue as TextEditingController?,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeErr(error: oLastNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addErr(error: oLastNameNullError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Nom',
        hintText: 'Saisissez votre nom',
        labelStyle: TextStyle(color: oBorderColor),

        //prefixStyle: TextStyle(color: Colors.red),
        //hintStyle: TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  TextFormField userFirstnameField() {
    return TextFormField(
      controller: userFirstName,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => userFirstName = newValue as TextEditingController?,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeErr(error: oFirstNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addErr(error: oFirstNameNullError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Prenom',
        hintText: 'Saisissez votre prenom',
        labelStyle: TextStyle(color: oBorderColor),

        //prefixStyle: TextStyle(color: Colors.red),
        //hintStyle: TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  void _showAlertDialog({String? title, String? message}) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title!),
      content: Text(message!),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  Future<void> create(
    String prenom,
    String nom,
    String phone,
    String address,
    String email,
    String passwords,
  ) async {
    try {
      await firestore!.collection("users").add({
        'prenom': 'prenom',
        'nom': 'nom',
        'phone': 'phone',
        'address': 'address',
        'email': 'email',
        'passwords': 'passwords',
        'isAdmin': 2,
        'createdAt': FieldValue.serverTimestamp()
      });
      _showAlertDialog(title: 'Success', message: 'Successful inserting ');
    } catch (e) {
      print('Error 1:  $e');
      _showAlertDialog(title: 'Error ', message: 'Error in inserting $email ');
    }
  }

  Future<void> tcreate() async {
    try {
      print("Start here ");
      await firestore.collection("users").add({
        'prenom': 'prenom',
        'nom': 'nom',
        'phone': 'phone',
        'address': 'address',
        'email': 'email',
        'passwords': 'passwords',
        'isAdmin': 2,
        'createdAt': FieldValue.serverTimestamp()
      });
      print("Start here end ");
      _showAlertDialog(title: 'Success', message: 'Successful inserting ');
    } catch (e) {
      print('Error 1:  $e');
      _showAlertDialog(title: 'Error ', message: 'Error in inserting  ');
    }
  }
}
*/
