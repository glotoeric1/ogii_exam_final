import 'package:flutter/material.dart';

import '../../operation/operation_screen.dart';
import '../../../widgets/bottoms/subtitle_text.dart';
import '../../../widgets/bottoms/title_text.dart';
import '../../../widgets/bottoms/bottom_text.dart';

class BodyScreenComponent extends StatelessWidget {
  static const String snackBarTxt = "Cette option ne pas disponible ";
  const BodyScreenComponent({Key? key}) : super(key: key);

  Expanded customCard(
      {String? cardTxt, VoidCallback? onTapHandler, Color? bgColorCard}) {
    return Expanded(
      child: Card(
        shape: new RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: Colors.red),
        ),
        color: bgColorCard,
        child: GestureDetector(
          child: TextButton(
            onPressed: onTapHandler,
            child: SizedBox(
              width: 100,
              height: 100,
              child: Center(
                child: Text(
                  cardTxt!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Card customCardOgii() {
    return Card(
      shape: StadiumBorder(),
      color: Colors.green.shade700,
      child: InkWell(
        onTap: null,
        child: SizedBox(
          width: 50,
          height: 50,
          child: Center(
            child: Text(
              'OGII',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
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
                TitleTxt(titleTextShow: "Dashboard"),
                SizedBox(height: 3),
                SubTitleText(subTitleTextShow: "Selectionnez votre operation"),
                //Divider(),
                Divider(thickness: 3, color: Colors.orange.shade900),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customCard(
                      cardTxt: "Mairie",
                      onTapHandler: () {
                        Navigator.pushNamed(context, OperationScreen.routeName);
                      },
                      bgColorCard: Colors.orange.shade900,
                    ),
                    customCard(
                      cardTxt: "Police",
                      onTapHandler: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(snackBarTxt),
                          ),
                        );
                      },
                      bgColorCard: Colors.orange,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customCardOgii(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customCard(
                      cardTxt: "Justice",
                      onTapHandler: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(snackBarTxt),
                          ),
                        );
                      },
                      bgColorCard: Colors.blue,
                    ),
                    customCard(
                      cardTxt: "ONT",
                      onTapHandler: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(snackBarTxt),
                          ),
                        );
                      },
                      bgColorCard: Colors.green,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                BottomText(
                  bottomTextShow:
                      "Merci d'avoir utiliser nos services et a bien-tot",
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
