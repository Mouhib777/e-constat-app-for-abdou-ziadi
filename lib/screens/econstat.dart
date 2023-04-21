import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_constat/constant/constant.dart';
import 'package:e_constat/screens/mapScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:simple_form_builder/formbuilder.dart';
import 'package:simple_form_builder/global/constant.dart';

class Econstat extends StatefulWidget {
  const Econstat({super.key});

  @override
  State<Econstat> createState() => _EconstatState();
}

class _EconstatState extends State<Econstat> {
  User? user = FirebaseAuth.instance.currentUser;
  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text(
            'Vehicule A',
            style: GoogleFonts.raleway(fontSize: 12),
          ),
          content: Column(
            children: [
              FormBuilder(
                  initialData: data0,
                  //title: "",
                  index: 0,
                  onSubmit: () async {
                    await FirebaseFirestore.instance
                        .collection('utilisateur')
                        .doc(user!.uid)
                        .set({'vehicule A': data0});
                  }),
              // FormBuilder(
              //     initialData: data1,
              //     title: 'Identification du conducteur',
              //     index: 0,
              //     onSubmit: () {})
            ],
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
  bool isCompleted = false;
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
      body: isCompleted
          ? mapScreen()
          : Stepper(
              elevation: 4,
              type: StepperType.horizontal,
              steps: getSteps(),
              currentStep: currentStep,
              onStepContinue: () {
                final lastStep = currentStep == getSteps().length - 1;
                if (lastStep) {
                  setState(() {
                    isCompleted = true;
                    var alertStyle = AlertStyle(
                      backgroundColor: thirdColor,
                      overlayColor: Color.fromARGB(103, 0, 0, 0),
                      animationType: AnimationType.grow,
                      isCloseButton: false,
                      isOverlayTapDismiss: false,
                      animationDuration: Duration(milliseconds: 400),
                      alertBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: primaryColor, width: 3),
                      ),
                      titleStyle: GoogleFonts.raleway(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 3),
                    );

                    Alert(
                      context: context,
                      style: alertStyle,
                      type: AlertType.none,
                      title: "Localiser l'accident",
                      buttons: [
                        DialogButton(
                          width: 130,
                          child: Text(
                            "D'accord",
                            style: GoogleFonts.raleway(
                                color: thirdColor,
                                fontSize: 20,
                                letterSpacing: 3),
                          ),
                          onPressed: () =>
                              Navigator.of(context, rootNavigator: true).pop(),
                          color: primaryColor,
                          radius: BorderRadius.circular(10.0),
                        ),
                      ],
                    ).show();
                  });
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
                            lastStep ? 'Confirmer' : 'Suivant',
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
            ),
    );
  }
}
