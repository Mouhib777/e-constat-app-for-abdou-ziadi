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
  final _formKey = GlobalKey<FormState>();
  final nom_assurance = TextEditingController();
  final police_dassurance = TextEditingController();
  final agence = TextEditingController();
  final valable_du = TextEditingController();
  final valable_au = TextEditingController();
  final C_nom = TextEditingController();
  final C_prenom = TextEditingController();
  final C_addresse = TextEditingController();
  final C_numPermis = TextEditingController();
  final C_permisDeli = TextEditingController();
  final A_nom = TextEditingController();
  final A_prenom = TextEditingController();
  final A_addresse = TextEditingController();
  final A_tel = TextEditingController();
  final V_marque = TextEditingController();
  final V_imma = TextEditingController();
  final V_venant = TextEditingController();
  final V_allant = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text("Societé d'assurance"),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Véhicule assuré par',
                            labelStyle: GoogleFonts.raleway()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Svp donner le nom de votre assurance';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Police d'assurance N°",
                            labelStyle: GoogleFonts.raleway()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Agence',
                            labelStyle: GoogleFonts.raleway()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                              child: Icon(Icons.calendar_month),
                              onTap: () {
                                _selectDate(context);
                                print(
                                    "${selectedDate.toLocal()}".split(' ')[0]);
                              },
                            ),
                            labelText: 'Attestation valable du',
                            labelStyle: GoogleFonts.raleway()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                              child: Icon(Icons.calendar_month),
                              onTap: () {},
                            ),
                            labelText: 'Attestation valable au',
                            labelStyle: GoogleFonts.raleway()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'hhhhhhh',
                            labelStyle: GoogleFonts.raleway()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'hhhhhhh',
                            labelStyle: GoogleFonts.raleway()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'hhhhhhh',
                            labelStyle: GoogleFonts.raleway()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'hhhhhhh',
                            labelStyle: GoogleFonts.raleway()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'hhhhhhh',
                            labelStyle: GoogleFonts.raleway()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'hhhhhhh',
                            labelStyle: GoogleFonts.raleway()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'hhhhhhh',
                            labelStyle: GoogleFonts.raleway()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'hhhhhhh'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'hhhhhhh'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'hhhhhhh'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'hhhhhhh'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'hhhhhhh'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'hhhhhhh'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'hhhhhhh'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'hhhhhhh'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                    ],
                  ))
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
          content: Column(
            children: [],
          ),
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
  Future uploadToDb() async {
    await FirebaseFirestore.instance
        .collection('utilisateur')
        .doc(user!.uid)
        .collection('les accidents')
        .doc()
        .set({});
    return uploadToDb();
  }

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
                              backgroundColor:
                                  lastStep ? primaryColor : secondaryColor,
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
                            // lastStep ?  : ControlsDetails.onStepCancel,

                            child: Text(
                              'Précedent',
                              style: GoogleFonts.raleway(),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15))),
                          )),
                        ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
