import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_constat/constant/constant.dart';
import 'package:e_constat/screens/mapScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:simple_form_builder/formbuilder.dart';
import 'package:simple_form_builder/global/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

const List<String> list = <String>[
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23',
  '24',
  '25',
  '26',
  '27',
  '28'
];

class Econstat extends StatefulWidget {
  const Econstat({super.key});

  @override
  State<Econstat> createState() => _EconstatState();
}

class _EconstatState extends State<Econstat> {
//    String dropdownValue = list.first;
  final ImagePicker _picker = ImagePicker();
  ImagePicker? imagePicker;
  File? _pickedImage;
  String? imageUrl;
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
  final V_sens_suivi = TextEditingController();
  final V_venant = TextEditingController();
  final V_allant = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;

  String dropdownValue = '1';
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

  DateTime selectedDate1 = DateTime.now();
  Future<void> _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate1 = picked;
      });
    }
  }

  handle_image_camera() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    _pickedImage = File(pickedFile!.path);

    if (_pickedImage != null) {
      setState(() {
        _pickedImage;
      });
    } else {
      EasyLoading.showError('Svp selectionner une image');
    }
  }

  handle_image_gallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    _pickedImage = File(pickedFile!.path);

    if (_pickedImage != null) {
      setState(() {
        _pickedImage;
      });
    } else {
      EasyLoading.showError('Svp selectionner une image');
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
              FadeInDownBig(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Societé d'assurance",
                          style:
                              GoogleFonts.raleway(fontWeight: FontWeight.w600),
                        ),
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
                          keyboardType: TextInputType.datetime,
                          controller: valable_du,
                          // readOnly: true,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                child: Icon(Icons.calendar_month),
                                // onTap: () {
                                //   _selectDate(context);
                                //   print(
                                //       "${selectedDate.toLocal()}".split(' ')[0]);
                                //   setState(() {
                                //     valable_du.text =
                                //         "${selectedDate.toLocal()}".split(' ')[0];
                                //   });
                                // },
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
                          keyboardType: TextInputType.datetime,
                          controller: valable_au,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                child: Icon(Icons.calendar_month),
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
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Identité du conducteur",
                          style:
                              GoogleFonts.raleway(fontWeight: FontWeight.w600),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Nom',
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
                              labelText: 'Prénom',
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
                              labelText: 'Addresse',
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
                              labelText: 'Permis de conduire N°',
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
                              labelText: 'Délivré le',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Assuré",
                          style:
                              GoogleFonts.raleway(fontWeight: FontWeight.w600),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Nom',
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
                              labelText: 'Prénom',
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
                              labelText: 'Addresse',
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
                              labelText: 'Tél,',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Identité du Véhicule",
                          style:
                              GoogleFonts.raleway(fontWeight: FontWeight.w600),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Marque',
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
                              labelText: "N° d'immatriculation",
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
                              labelText: 'Sens suivi',
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
                              labelText: 'Venant a',
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
                              labelText: 'Allant a ',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Indiquer par un numéro le point du choc initial",
                          style:
                              GoogleFonts.raleway(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                            width: 300,
                            child: Image.asset('assets/images/constat.png')),
                        DropdownButton<String>(
                          iconSize: 40,
                          value: dropdownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            '1',
                            '2',
                            '3',
                            '4',
                            '5',
                            '6',
                            '7',
                            '8',
                            '9',
                            '10',
                            '11',
                            '12',
                            '13',
                            '14',
                            '15',
                            '16',
                            '17',
                            '18',
                            '19',
                            '20',
                            '21',
                            '22',
                            '23',
                            '24',
                            '25',
                            '26',
                            '27',
                            '28'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                        ),
                        Text(
                          'numéro selectionné: $dropdownValue',
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Prendre une photo pour la voiture aprés l'accident",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(CupertinoIcons.camera))
                      ],
                    )),
              )
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
