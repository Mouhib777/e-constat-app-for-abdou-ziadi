import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_constat/constant/constant.dart';
import 'package:e_constat/screens/option.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class registreScreen extends StatefulWidget {
  const registreScreen({super.key});

  @override
  State<registreScreen> createState() => _registreScreenState();
}

class _registreScreenState extends State<registreScreen> {
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "S'inscrire",
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
            SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 45,
                width: 180,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      backgroundColor: secondaryColor,
                    ),
                    child: Text('Registre Now',
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: thirdColor,
                            fontWeight: FontWeight.w600)),
                    onPressed: () async {
                      try {
                        UserCredential user = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email!.trim(),
                                password: password!.trim());
                        final User? userr = FirebaseAuth.instance.currentUser;
                        final _uid = userr!.uid;

                        await FirebaseFirestore.instance
                            .collection('utilisateur')
                            .doc(_uid)
                            .set({
                          "email": email,
                          "id": _uid,
                          "password": password,
                        });
                        await FirebaseFirestore.instance
                            .collection('utilisateur')
                            .doc(_uid)
                            .collection('les accidents')
                            .doc(_uid)
                            .set({
                          "Vehicule A": [
                            {"registre": "true"}
                          ]
                        });

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => optionScreen()));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          var snackBar = SnackBar(
                              backgroundColor: secondaryColor,
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'mot de passe faible',
                                    style: GoogleFonts.raleway(),
                                  ),
                                ],
                              ));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (e.code == 'email-already-in-use') {
                          var snackBar = SnackBar(
                              backgroundColor: secondaryColor,
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'cette addresse e-mail est déja utilisé',
                                    style: GoogleFonts.raleway(),
                                  ),
                                ],
                              ));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } catch (ex) {
                        print(ex);
                      }

                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
