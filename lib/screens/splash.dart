import 'dart:async';

import 'package:e_constat/constant/constant.dart';
import 'package:e_constat/providers/locationProvider.dart';
import 'package:e_constat/screens/homeScreen.dart';
import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Timer(
        Duration(
          seconds: 3,
        ), () async {
      final locationData =
          Provider.of<LocationProvider>(context, listen: false);
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      await locationData.getCurrentPosition();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => homeScreen(),
          ));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: primaryColor,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              Image.asset("assets/images/logo.png"),
              SizedBox(
                height: 330,
              ),
              Text(
                "Zéro Papier",
                style: GoogleFonts.raleway(
                    wordSpacing: 5,
                    letterSpacing: 8,
                    color: secondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ));
  }
}
