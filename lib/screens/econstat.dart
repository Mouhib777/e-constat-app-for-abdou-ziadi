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
  final _formKey1 = GlobalKey<FormState>();
  final nom_assurance1 = TextEditingController();
  final police_dassurance1 = TextEditingController();
  final agence1 = TextEditingController();
  final valable_du1 = TextEditingController();
  final valable_au1 = TextEditingController();
  final C_nom1 = TextEditingController();
  final C_prenom1 = TextEditingController();
  final C_addresse1 = TextEditingController();
  final C_numPermis1 = TextEditingController();
  final C_permisDeli1 = TextEditingController();
  final A_nom1 = TextEditingController();
  final A_prenom1 = TextEditingController();
  final A_addresse1 = TextEditingController();
  final A_tel1 = TextEditingController();
  final V_marque1 = TextEditingController();
  final V_imma1 = TextEditingController();
  final V_sens_suivi1 = TextEditingController();
  final V_venant1 = TextEditingController();
  final V_allant1 = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;

  String dropdownValue = '1';

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

  bool isDetailComplete() {
    if (currentStep == 0) {
      //check sender fields
      if (nom_assurance.text.isEmpty ||
          police_dassurance.text.isEmpty ||
          agence.text.isEmpty ||
          valable_du.text.isEmpty ||
          valable_au.text.isEmpty ||
          C_nom.text.isEmpty ||
          C_prenom.text.isEmpty ||
          C_addresse.text.isEmpty ||
          C_numPermis.text.isEmpty ||
          C_permisDeli.text.isEmpty ||
          A_nom.text.isEmpty ||
          A_prenom.text.isEmpty ||
          A_addresse.text.isEmpty ||
          A_tel.text.isEmpty ||
          V_marque.text.isEmpty ||
          V_imma.text.isEmpty ||
          V_sens_suivi.text.isEmpty ||
          V_venant.text.isEmpty ||
          V_allant.text.isEmpty) {
        return false;
      } else {
        return true; //if all fields are not empty
      }
    } else if (currentStep == 1) {
      if (nom_assurance1.text.isEmpty ||
          police_dassurance1.text.isEmpty ||
          agence1.text.isEmpty ||
          valable_du1.text.isEmpty ||
          valable_au1.text.isEmpty ||
          C_nom1.text.isEmpty ||
          C_prenom1.text.isEmpty ||
          C_addresse1.text.isEmpty ||
          C_numPermis1.text.isEmpty ||
          C_permisDeli1.text.isEmpty ||
          A_nom1.text.isEmpty ||
          A_prenom1.text.isEmpty ||
          A_addresse1.text.isEmpty ||
          A_tel1.text.isEmpty ||
          V_marque1.text.isEmpty ||
          V_imma1.text.isEmpty ||
          V_sens_suivi1.text.isEmpty ||
          V_venant1.text.isEmpty ||
          V_allant1.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    }
    return false;
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
                          controller: nom_assurance,
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
                          controller: police_dassurance,
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
                          controller: agence,
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
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                child: Icon(Icons.calendar_month),
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
                          controller: C_nom,
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
                          controller: C_prenom,
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
                          controller: C_addresse,
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
                          controller: C_numPermis,
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
                          controller: C_permisDeli,
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
                          controller: A_nom,
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
                          controller: A_prenom,
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
                          controller: A_addresse,
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
                          controller: A_tel,
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
                          controller: V_marque,
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
                          controller: V_imma,
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
                          controller: V_sens_suivi,
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
                          controller: V_venant,
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
                          controller: V_allant,
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
                        InkWell(
                          onTap: () async {
                            var alertStyle = AlertStyle(
                              overlayColor: Color.fromARGB(62, 0, 0, 0),
                              animationType: AnimationType.shrink,
                              isCloseButton: false,
                              isOverlayTapDismiss: true,
                              descStyle: GoogleFonts.raleway(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                              animationDuration: Duration(milliseconds: 400),
                              alertBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: BorderSide(
                                  color: secondaryColor,
                                ),
                              ),
                              titleStyle: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            );

                            Alert(
                              context: context,
                              style: alertStyle,
                              type: AlertType.none,
                              title:
                                  "Une photo pour la voiture aprés l'accident",
                              buttons: [
                                DialogButton(
                                  child: Icon(
                                    Icons.drive_folder_upload,
                                    color: thirdColor,
                                  ),
                                  onPressed: () {
                                    handle_image_gallery();
                                    Navigator.pop(context);
                                  },
                                  color: primaryColor,
                                  radius: BorderRadius.circular(10.0),
                                ),
                                DialogButton(
                                  child: Icon(
                                    CupertinoIcons.camera,
                                    color: thirdColor,
                                  ),
                                  onPressed: () {
                                    handle_image_camera();
                                    Navigator.pop(context);
                                  },
                                  color: primaryColor,
                                  radius: BorderRadius.circular(10.0),
                                ),
                              ],
                            ).show();
                          },
                          child: SizedBox(
                            height: 190,
                            width: 250,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: ClipRRect(
                                  child: _pickedImage == null
                                      ? Center(
                                          child: Text(
                                            'Clicker ici',
                                            style: GoogleFonts.raleway(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 3,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        )
                                      : Column(
                                          children: <Widget>[
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2217,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.95,
                                              child: AspectRatio(
                                                aspectRatio: 16 / 9,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: Color.fromARGB(
                                                        15, 33, 149, 243),
                                                    image: DecorationImage(
                                                      fit: BoxFit.contain,
                                                      image: FileImage(
                                                          _pickedImage!),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                )),
                          ),
                        ),
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
