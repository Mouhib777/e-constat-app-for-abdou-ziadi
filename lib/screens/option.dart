import 'package:animate_do/animate_do.dart';
import 'package:e_constat/constant/constant.dart';

import 'package:e_constat/screens/sos.dart';
import 'package:e_constat/screens/vehiculeA.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class optionScreen extends StatefulWidget {
  const optionScreen({super.key});

  @override
  State<optionScreen> createState() => _optionScreenState();
}

class _optionScreenState extends State<optionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeIn(
              delay: Duration(milliseconds: 300),
              child: SizedBox(
                width: 170,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => sos(),
                        ));
                  },
                  child: Text(
                    "Appeler SOS",
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
            ),
            SizedBox(
              height: 40,
            ),
            FadeIn(
              delay: Duration(milliseconds: 1500),
              child: SizedBox(
                width: 220,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VehiculeA(),
                        ));
                  },
                  child: Text(
                    "Remplir un e-constat",
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
    );
  }
}
