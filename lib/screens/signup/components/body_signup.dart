import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:ogiiapp/database/user_database.dart';
import 'package:ogiiapp/screens/login/login_screen.dart';
import 'package:ogiiapp/widgets/bottoms/signup_login_txt.dart';
import 'package:ogiiapp/widgets/buttons/btn_primary_icon.dart';

import '../../../const.dart';
//import '../../../screens/signup/components/form_signup.dart';
import '../../../widgets/bottoms/bottom_text.dart';
import '../../../widgets/bottoms/subtitle_text.dart';
import '../../../widgets/bottoms/title_text.dart';
import 'users_detail.dart';

class BodySignup extends StatefulWidget {
  BodySignup({Key? key}) : super(key: key);
  //UserDatabase db;

  @override
  _BodySignupState createState() => _BodySignupState();
}

class _BodySignupState extends State<BodySignup> {
  final List<String> errors = [];

  final _formKey = GlobalKey<FormState>();
  TextEditingController? userEmail = new TextEditingController();
  TextEditingController? userPassword = new TextEditingController();
  TextEditingController? userPhone = new TextEditingController();
  TextEditingController? userAddresse = new TextEditingController();
  TextEditingController? userFirstName = new TextEditingController();
  TextEditingController? userLastName = new TextEditingController();

  FirebaseFirestore? firestore;
  initiliaze() {
    firestore = FirebaseFirestore.instance;
  }

/*
  UserDatabase? db;
  initilialize() {
    db = UserDatabase();
    db!.initiliase();
  }
  */

  @override
  void initState() {
    super.initState();
    initiliaze();
  }

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
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                TitleTxt(titleTextShow: "S'inscrire"),
                SizedBox(height: 5),
                SubTitleText(
                    subTitleTextShow:
                        "Saisissez votre infomation pour se connecter"),
                Divider(thickness: 3, color: Colors.orange.shade900),
                SizedBox(height: 20),
                //FormSignup(),
                //here
                Form(
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
                          create(
                            prenom: userFirstName!.text,
                            nom: userLastName!.text,
                            phone: userPhone!.text,
                            address: userAddresse!.text,
                            email: userEmail!.text,
                            passwords: userPassword!.text,
                          );
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
                    ],
                  ),
                ),

                //end
                SizedBox(height: 20),
                BottomText(
                    bottomTextShow:
                        "Merci d'avoir utiliser notre services et a bien-tot"),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text(
        title!,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.green.shade700,
        ),
      ),
      content: Text(
        message!,
        textAlign: TextAlign.center,
      ),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  Future<void> create({
    required String prenom,
    required String nom,
    required String phone,
    required String address,
    required String email,
    required String passwords,
  }) async {
    try {
      await firestore!.collection("users").add({
        'prenom': prenom,
        'nom': nom,
        'phone': phone,
        'address': address,
        'email': email,
        'passwords': passwords,
        'isAdmin': 2,
        'createdAt': FieldValue.serverTimestamp()
      });
      _showAlertDialog(title: 'Success', message: 'Avec sucess ');
      _clearInput();
    } catch (e) {
      print('Error 1:  $e');
      _showAlertDialog(title: 'Error ', message: 'Error in inserting $email ');
    }
  }

  void _clearInput() {
    userAddresse!.clear();
    userFirstName!.clear();
    userLastName!.clear();
    userEmail!.clear();
    userPassword!.clear();
    userPhone!.clear();
  }
}
