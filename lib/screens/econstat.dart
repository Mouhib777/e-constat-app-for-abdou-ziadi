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
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text(
            'Vehicule A',
            style: GoogleFonts.raleway(fontSize: 12),
          ),
          content: Column(
            children: [],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text(
            'Vehicule B',
            style: GoogleFonts.raleway(fontSize: 12),
          ),
          content: Container(),
        ),
        Step(
          isActive: currentStep >= 2,
          title: Text(
            'Confirmation',
            style: GoogleFonts.raleway(fontSize: 12),
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
        elevation: 4,
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        onStepContinue: () {
          final lastStep = currentStep == getSteps().length - 1;
          if (lastStep) {
            print('okk');
          } else {
            setState(() {
              currentStep += 1;
            });
          }
        },
        onStepCancel: () {
          currentStep == 0
              ? null
              : setState(() {
                  currentStep -= 1;
                });
        },
        controlsBuilder: (BuildContext context, ControlsDetails) {
          final lastStep = currentStep == getSteps().length - 1;
          return Container(
            margin: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: Expanded(
                      child: ElevatedButton(
                    onPressed: ControlsDetails.onStepContinue,
                    child: Text(
                      lastStep ? 'Confimer' : 'Suivant',
                      style: GoogleFonts.raleway(),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.circular(15))),
                  )),
                ),
                SizedBox(
                  width: 15,
                ),
                if (currentStep != 0)
                  SizedBox(
                    width: 100,
                    child: Expanded(
                        child: ElevatedButton(
                      onPressed: ControlsDetails.onStepCancel,
                      child: Text(
                        'Précedent',
                        style: GoogleFonts.raleway(),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadius.circular(15))),
                    )),
                  )
              ],
            ),
          );
        },

        // onStepTapped: (step) {
        //   setState(() {
        //     currentStep = step;
        //   });
        // },
      ),
    );
  }
}
