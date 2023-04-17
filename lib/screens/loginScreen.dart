import 'package:e_constat/constant/constant.dart';
import 'package:e_constat/screens/option.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Se connecter",
          style: GoogleFonts.raleway(letterSpacing: 1, color: thirdColor),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: TextField(
                //cursorColor: secondaryColor,
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.raleway(),
                  labelStyle: GoogleFonts.raleway(),
                  counterStyle: GoogleFonts.raleway(),
                  hintText: 'address@mail.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  labelText: '  addresse e-mail',
                  // counterText:
                  //     '*Please use a verified e-mail',
                ),
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                maxLength: 40,
                onChanged: (value) {
                  email = value;
                },
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.raleway(),
                  labelStyle: GoogleFonts.raleway(),
                  counterStyle: GoogleFonts.raleway(),
                  hintText: '*******',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35)),
                  labelText: '  Mot de passe',
                  // counterText:
                  //     '*Please use a verified e-mail',
                ),
                autofocus: false,
                keyboardType: TextInputType.text,
                obscureText: true,
                maxLength: 8,
                onChanged: (value) {
                  password = value;
                },
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
                height: 45,
                width: 180,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    backgroundColor: secondaryColor,
                  ),
                  child: Text('Se connecter',
                      style: GoogleFonts.raleway(
                          fontSize: 20,
                          color: thirdColor,
                          fontWeight: FontWeight.w600)),
                  onPressed: () async {
                    try {
                      UserCredential user = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email!.trim(), password: password!.trim());

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => optionScreen(),
                          ));
                    } on FirebaseAuthException catch (ex) {
                      if (ex.code == 'user-not-found') {
                        var snackBar = SnackBar(
                            backgroundColor: secondaryColor,
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Aucun utilisateur avec ces données',
                                  style: GoogleFonts.raleway(),
                                ),
                              ],
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else if (ex.code == 'wrong-password') {
                        var snackBar = SnackBar(
                            backgroundColor: secondaryColor,
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'mot de passe incorrecte',
                                  style: GoogleFonts.raleway(),
                                ),
                              ],
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else if (ex.code == 'invalid-email') {
                        var snackBar = SnackBar(
                            backgroundColor: secondaryColor,
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'addresse e-mail incorrecte',
                                  style: GoogleFonts.raleway(),
                                ),
                              ],
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }
}
