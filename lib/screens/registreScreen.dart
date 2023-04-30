import 'package:e_constat/constant/constant.dart';
import 'package:e_constat/screens/option.dart';

import 'package:flutter/material.dart';

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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => optionScreen()));
                    }))
          ],
        ),
      ),
    );
  }
}
