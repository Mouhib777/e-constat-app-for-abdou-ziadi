import 'package:e_constat/constant/constant.dart';
import 'package:e_constat/screens/loginScreen.dart';
import 'package:e_constat/screens/registreScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class loginRegistre extends StatefulWidget {
  const loginRegistre({super.key});

  @override
  State<loginRegistre> createState() => _loginRegistreState();
}

class _loginRegistreState extends State<loginRegistre> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/images/road.jpg",
            ),
            fit: BoxFit.fill,
            opacity: 210),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: Column(),
          backgroundColor: primaryColor,
          title: ZoomIn(
            child: Text(
              'E-Constat',
              style: GoogleFonts.raleway(),
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeIn(
                delay: Duration(seconds: 2),
                child: SizedBox(
                  width: 170,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => registreScreen()));
                    },
                    child: Text(
                      "S'inscrire",
                      style: GoogleFonts.raleway(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(14)),
                      backgroundColor: primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeIn(
                delay: Duration(seconds: 2),
                child: SizedBox(
                  width: 170,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => loginScreen()));
                    },
                    child: Text(
                      "Se connecter",
                      style: GoogleFonts.raleway(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(14)),
                      backgroundColor: primaryColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
