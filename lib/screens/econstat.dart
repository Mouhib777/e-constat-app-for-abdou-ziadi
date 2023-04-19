import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Econstat extends StatefulWidget {
  const Econstat({super.key});

  @override
  State<Econstat> createState() => _EconstatState();
}

class _EconstatState extends State<Econstat> {
  List<Step> getSteps() => [
        Step(
          isActive: currentStep >= 0,
          title: Text(
            'Vehicule A',
            style: GoogleFonts.raleway(),
          ),
          content: Container(),
        ),
        Step(
          isActive: currentStep >= 1,
          title: Text(
            'Vehicule B',
            style: GoogleFonts.raleway(),
          ),
          content: Container(),
        ),
        Step(
          isActive: currentStep >= 2,
          title: Text(
            'Confirmation',
            style: GoogleFonts.raleway(),
          ),
          content: Container(),
        )
      ];

  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Remplir vos e-constat',
          style: GoogleFonts.raleway(
              fontWeight: FontWeight.bold, letterSpacing: 3),
        ),
        centerTitle: true,
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        onStepContinue: () {
          final lastStep = currentStep == getSteps().length - 1;
          if (lastStep) {
            print('okk');
          }
          setState(() {
            currentStep += 1;
          });
        },
        onStepCancel: () {
          setState(() {
            currentStep -= 1;
          });
        },
      ),
    );
  }
}
