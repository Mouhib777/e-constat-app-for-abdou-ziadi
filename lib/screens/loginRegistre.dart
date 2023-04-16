import 'package:e_constat/constant/constant.dart';
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
          title: Text(
            'E-Constat',
            style: GoogleFonts.raleway(),
          ),
          centerTitle: true,
        ),
      ),
    );
  }
}
