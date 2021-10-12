import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../../widgets/buttons/btn_primary.dart';
import '../../../const.dart';

class FormActeDeNaissance extends StatefulWidget {
  const FormActeDeNaissance({Key? key}) : super(key: key);

  @override
  _FormActeDeNaissanceState createState() => _FormActeDeNaissanceState();
}

class _FormActeDeNaissanceState extends State<FormActeDeNaissance> {
  final _formKey = GlobalKey<FormState>();
  String? userEmail;
  String? userPhone;
  String? userAddresse;
  String? userFirstName;
  String? userLastName;
  String? firstNamePere;
  String? lastNamePere;
  String? firstNameMere;
  String? lastNameMere;
  DateTime? dateOfBirth;
  Color txtColor = Colors.green.shade700;

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
          userFirstnameField(),
          SizedBox(height: 10),
          userLastField(),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  dateOfBirth == null
                      ? 'Chossez la date '
                      : 'Date: ${DateFormat.yMd().format(dateOfBirth!)}',
                  style: TextStyle(color: txtColor),
                ),
              ),
              OutlinedButton(
                onPressed: _presentDatePicker,
                child: Text(
                  "Date de naissance",
                  style: TextStyle(color: txtColor),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          userAddressField(),
          SizedBox(height: 10),
          userEmailField(),
          SizedBox(height: 10),
          userPhoneField(),
          SizedBox(height: 10),
          userFirstPereField(),
          SizedBox(height: 10),
          userLastPereField(),
          SizedBox(height: 10),
          userFirstNameMereField(),
          SizedBox(height: 10),
          userLastMereField(),
          SizedBox(height: 15),
          BtnPrimary(btnText: "Valider", btnOnPressAction: () {}),
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

  TextFormField userPhoneField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => userPhone = newValue,
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
      obscureText: true,
      onSaved: (newValue) => userAddresse = newValue,
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

  TextFormField userFirstPereField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => userLastName = newValue,
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
        labelText: 'Prenom du pere',
        hintText: 'Saisissez votre prenom du pere',
        labelStyle: TextStyle(color: oBorderColor),

        //prefixStyle: TextStyle(color: Colors.red),
        //hintStyle: TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  TextFormField userFirstNameMereField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => userLastName = newValue,
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
        labelText: 'Prenom de la mere',
        hintText: 'Saisissez votre prenom de la mere',
        labelStyle: TextStyle(color: oBorderColor),

        //prefixStyle: TextStyle(color: Colors.red),
        //hintStyle: TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  TextFormField userLastMereField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => userLastName = newValue,
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
        labelText: 'Nom de la mere',
        hintText: 'Saisissez votre nom de la mere',
        labelStyle: TextStyle(color: oBorderColor),

        //prefixStyle: TextStyle(color: Colors.red),
        //hintStyle: TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  TextFormField userLastPereField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => userLastName = newValue,
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
        labelText: 'Nom du pere',
        hintText: 'Saisissez votre nom du pere',
        labelStyle: TextStyle(color: oBorderColor),

        //prefixStyle: TextStyle(color: Colors.red),
        //hintStyle: TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  TextFormField userLastField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => userLastName = newValue,
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
      obscureText: true,
      onSaved: (newValue) => userFirstName = newValue,
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

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1960),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme(
                primary: Colors.green.shade700,
                onPrimary: Colors.white,
                onSurface: Colors.green.shade900,
                primaryVariant: Colors.green.shade900,
                secondaryVariant: Colors.green.shade900,
                secondary: Colors.green.shade900,
                error: Colors.red,
                onError: Colors.redAccent,
                onBackground: Colors.green.shade400,
                background: Colors.green.shade900,
                brightness: Brightness.light,
                surface: Colors.green.shade900,
                onSecondary: Colors.green.shade900,
              ),
            ),
            child: child!,
          );
        }).then((pickeddate) {
      if (pickeddate == null) {
        return;
      }
      setState(() {
        dateOfBirth = pickeddate;
      });
    });
  }
}
