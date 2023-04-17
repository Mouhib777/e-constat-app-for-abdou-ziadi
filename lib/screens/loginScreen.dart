import 'package:e_constat/constant/constant.dart';
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
          ],
        ),
      ),
    );
  }
}
