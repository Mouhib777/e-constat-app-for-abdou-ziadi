import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class VehiculeA extends StatefulWidget {
  const VehiculeA({super.key});

  @override
  State<VehiculeA> createState() => _VehiculeAState();
}

class _VehiculeAState extends State<VehiculeA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vehicule A',
          style: GoogleFonts.raleway(),
        ),
        centerTitle: true,
      ),
    );
  }
}
