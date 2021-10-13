import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ogiiapp/component/form_error.dart';
import 'package:ogiiapp/screens/signup/signup_screen.dart';
import 'package:ogiiapp/widgets/bottoms/signup_login_txt.dart';
import 'package:ogiiapp/widgets/buttons/btn_primary_icon.dart';
import 'package:ogiiapp/widgets/tabs_button/tab_button.dart';

import '../../../const.dart';
import '../../../widgets/bottoms/bottom_text.dart';
import '../../../widgets/bottoms/subtitle_text.dart';
import '../../../widgets/bottoms/title_text.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({Key? key}) : super(key: key);

  @override
  _BodyLoginState createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  TextEditingController? userEmail = new TextEditingController();
  TextEditingController? userPassword = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool userCheck = false;

  final List<String> errors = [];

  FirebaseFirestore? firestore;
  initiliaze() {
    firestore = FirebaseFirestore.instance;
  }

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
                SizedBox(height: 50),
                TitleTxt(titleTextShow: "Connexion"),
                SizedBox(height: 15),
                SubTitleText(
                    subTitleTextShow:
                        "Saisissez votre nom d\' utilisateur et le mot de passe"),
                Divider(thickness: 3, color: Colors.orange.shade900),
                SizedBox(height: 20),
                //here
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      userEmailField(),
                      SizedBox(height: 10),
                      userPasswordField(),
                      SizedBox(height: 5),
                      FormError(errors: errors),
                      SizedBox(height: 10),
                      BtnPrimaryIcon(
                        btnText: "Connexion",
                        btnOnPressAction: () {
                          //next route

                          loginLogic(userEmail!.text, userPassword!.text);
                        },
                        btnIcon: Icons.login_rounded,
                      ),
                      SizedBox(height: 30),
                      SignupLoginTxt(
                        txtToShow: "Je ne pas un compte : ",
                        btnTxt: "S\'inscrire ici ",
                        btnHandler: () {
                          Navigator.pushNamed(context, SignupScreen.routeName);
                        },
                      ),
                    ],
                  ),
                ),

                //here
                //LoginForm(),
                SizedBox(height: 30),
                BottomText(
                  bottomTextShow:
                      "En cliquent sur connecter vous avez acceptez les conditions",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField userEmailField() {
    return TextFormField(
      controller: userEmail,
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

  Future<String?> loginLogic(String email, String pass) async {
    QuerySnapshot querySnapshot;
    try {
      querySnapshot = await firestore!
          .collection('users')
          .where('email', isEqualTo: email)
          .where('passwords', isEqualTo: pass)
          .get();

      if (querySnapshot.docs.isEmpty) {
        userCheck = false;
        _showAlertDialog(
            title: 'Connexion - Erreur',
            message: "Nom utilisateur et mot de passe iccorrect");
      } else if (querySnapshot.docs.isNotEmpty) {
        userCheck = true;
        Navigator.pushNamed(
          context,
          TabsScreenButton.routeName,
          arguments: {'email': email, 'passwords': pass},
        );
      } else {
        userCheck = false;
        _showAlertDialog(
            title: 'Connexion - Erreur',
            message: "Nom utilisateur et mot de passe iccorrect");
      }
    } catch (e) {
      print('Erreur : $e');
    }
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
          color: Colors.red,
        ),
      ),
      content: Text(
        message!,
        textAlign: TextAlign.center,
      ),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
