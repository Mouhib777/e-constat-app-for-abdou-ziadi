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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.asset("assets/images/gardenational.png")),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Garde National",
                  style: GoogleFonts.raleway(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.asset("assets/images/protectioncivile.png")),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Protection Civile",
                  style: GoogleFonts.raleway(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
