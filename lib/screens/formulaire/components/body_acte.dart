import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:ogiiapp/screens/formulaire/components/form_acte.dart';
import 'package:ogiiapp/widgets/bottoms/bottom_text.dart';
import 'package:ogiiapp/widgets/bottoms/subtitle_text.dart';
import 'package:ogiiapp/widgets/bottoms/title_text.dart';
import 'package:ogiiapp/widgets/buttons/btn_primary.dart';

import '../../../const.dart';

class BodyActeDeNaissance extends StatefulWidget {
  const BodyActeDeNaissance({Key? key}) : super(key: key);

  @override
  _BodyActeDeNaissanceState createState() => _BodyActeDeNaissanceState();
}

class _BodyActeDeNaissanceState extends State<BodyActeDeNaissance> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController userEmail = new TextEditingController();
  TextEditingController userPhone = new TextEditingController();
  TextEditingController userAddresse = new TextEditingController();
  TextEditingController userFirstName = new TextEditingController();
  TextEditingController userLastName = new TextEditingController();
  TextEditingController firstNamePere = new TextEditingController();
  TextEditingController lastNamePere = new TextEditingController();
  TextEditingController firstNameMere = new TextEditingController();
  TextEditingController lastNameMere = new TextEditingController();
  var dateOfBirth;
  Color txtColor = Colors.orange.shade900;
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
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                TitleTxt(titleTextShow: "Demande"),
                SizedBox(height: 6),
                SubTitleText(subTitleTextShow: "Saisissez votre information"),
                SizedBox(height: 15),
                Form(
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
                      BtnPrimary(
                          btnText: "Valider",
                          btnOnPressAction: () {
                            create(
                              prenom: userFirstName.text,
                              nom: userLastName.text,
                              phone: userPhone.text,
                              address: userAddresse.text,
                              email: userEmail.text,
                              firstNamePere: firstNamePere.text,
                              lastNamePere: lastNamePere.text,
                              firstNameMere: firstNameMere.text,
                              lastNameMere: lastNameMere.text,
                            );
                          }),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                BottomText(
                    bottomTextShow:
                        "En cliquez sur valider vous avez accepter les conditions generale"),
                SizedBox(height: 15),
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
      onSaved: (newValue) => userEmail = newValue as TextEditingController,
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
      controller: userPhone,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => userPhone = newValue as TextEditingController,
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
      onSaved: (newValue) => userAddresse = newValue as TextEditingController,
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
      controller: firstNamePere,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => firstNamePere = newValue as TextEditingController,
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
      controller: firstNameMere,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => firstNameMere = newValue as TextEditingController,
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
      controller: lastNameMere,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => lastNameMere = newValue as TextEditingController,
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
      controller: lastNamePere,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => userLastName = newValue as TextEditingController,
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
      controller: userLastName,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => userLastName = newValue as TextEditingController,
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
      onSaved: (newValue) => userFirstName = newValue as TextEditingController,
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
                primary: Colors.orange.shade700,
                onPrimary: Colors.white,
                onSurface: Colors.orange.shade900,
                primaryVariant: Colors.orange.shade900,
                secondaryVariant: Colors.orange.shade900,
                secondary: Colors.orange.shade900,
                error: Colors.red,
                onError: Colors.redAccent,
                onBackground: Colors.green.shade400,
                background: Colors.orange.shade900,
                brightness: Brightness.light,
                surface: Colors.orange.shade900,
                onSecondary: Colors.orange.shade900,
              ),
            ),
            child: child!,
          );
        }).then(
      (pickeddate) {
        if (pickeddate == null) {
          return;
        }
        setState(
          () {
            dateOfBirth = pickeddate;
          },
        );
      },
    );
  }

  //new code

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
    required String firstNamePere,
    required String lastNamePere,
    required String firstNameMere,
    required String lastNameMere,
    var dateOfBirth,
  }) async {
    try {
      await firestore!.collection("mairie").add({
        'userPrenom': prenom,
        'userNom': nom,
        'phone': phone,
        'address': address,
        'email': email,
        'disponible': 2, // 2: non disponibe et 1 : disponible
        'firstNamePere': firstNamePere,
        'lastNamePere': lastNamePere,
        'firstNameMere': firstNameMere,
        'lastNameMere': lastNameMere,
        'dateOfBirth': dateOfBirth,
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
    userAddresse.clear();
    userFirstName.clear();
    userLastName.clear();
    userEmail.clear();
    userPhone.clear();
    firstNameMere.clear();
    lastNamePere.clear();
    firstNameMere.clear();
    lastNameMere.clear();
  }
}
