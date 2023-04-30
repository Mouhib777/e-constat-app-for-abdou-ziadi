import 'package:e_constat/constant/constant.dart';

import 'package:e_constat/screens/option.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            colorFilter: ColorFilter.mode(primaryColor, BlendMode.multiply),
            image: AssetImage(
              "assets/images/road.jpg",
            ),
            fit: BoxFit.fill,
            opacity: 1),
      ),
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlipInY(
                child: Text(
                  "Bienvenue",
                  style: GoogleFonts.raleway(
                      letterSpacing: 3,
                      color: thirdColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              FadeInDown(
                child: Text(
                  "E- constat auto",
                  style: GoogleFonts.raleway(
                      letterSpacing: 4,
                      color: secondaryColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              FadeInUp(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "l'application officielle des assureurs tunisiennes",
                      style: GoogleFonts.raleway(
                          letterSpacing: 1,
                          color: thirdColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "🇹🇳",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 130,
              ),
              FadeIn(
                delay: Duration(milliseconds: 1500),
                child: SizedBox(
                  width: 170,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => optionScreen()));
                    },
                    child: Text(
                      "Commencez",
                      style: GoogleFonts.raleway(
                          fontSize: 18,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
