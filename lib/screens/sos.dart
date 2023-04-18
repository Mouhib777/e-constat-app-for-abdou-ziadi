import 'package:e_constat/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class sos extends StatefulWidget {
  const sos({super.key});

  @override
  State<sos> createState() => _sosState();
}

class _sosState extends State<sos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Selectionner le service SOS',
          style: GoogleFonts.raleway(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset("assets/images/gardenational.png")],
        ),
      ),
    );
  }
}
