import 'package:e_constat/constant/constant.dart';
import 'package:e_constat/screens/loginScreen.dart';
import 'package:e_constat/screens/registreScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class loginRegistre extends StatelessWidget {
  const loginRegistre({super.key});

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
              style: GoogleFonts.raleway(
                  color: thirdColor,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w500),
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // FadeIn(
              //child:
              SizedBox(
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
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: thirdColor),
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
              // ),
              SizedBox(
                height: 20,
              ),
              // FadeIn(
              // child:
              SizedBox(
                width: 170,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => loginScreen()));
                  },
                  child: Text(
                    "Se connecter",
                    style: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: thirdColor),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.circular(14)),
                    backgroundColor: primaryColor,
                  ),
                ),
                //    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
