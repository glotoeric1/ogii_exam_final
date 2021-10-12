import 'package:flutter/material.dart';
import 'package:ogiiapp/screens/signup/signup_screen.dart';
//import 'package:ogiiapp/screens/tab_screens/tab_screen.dart';
import 'package:ogiiapp/widgets/bottoms/signup_login_txt.dart';
import 'package:ogiiapp/widgets/tabs_button/tab_button.dart';

//import '../../../screens/home/home_screen.dart';
import '../../../widgets/buttons/btn_primary_icon.dart';
import '../../../component/form_error.dart';
import '../../../const.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? userEmail;
  String? userPassword;

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
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                //next route
                Navigator.pushNamed(context, TabsScreenButton.routeName);
              }
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
    );
  }

  TextFormField userEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => userEmail = newValue,
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
      obscureText: true,
      onSaved: (newValue) => userPassword = newValue,
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
        userPassword = value;
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
}
