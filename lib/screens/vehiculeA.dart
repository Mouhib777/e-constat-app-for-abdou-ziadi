import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_constat/constant/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class VehiculeA extends StatefulWidget {
  const VehiculeA({super.key});

  @override
  State<VehiculeA> createState() => _VehiculeAState();
}

class _VehiculeAState extends State<VehiculeA> {
  final ImagePicker _picker = ImagePicker();
  User? user = FirebaseAuth.instance.currentUser;

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.88,
              child: Column(
                children: [
                  FadeInDownBig(
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Societé d'assurance",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w600),
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
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w600),
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
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w600),
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
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w600),
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
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                                width: 300,
                                child:
                                    Image.asset('assets/images/constat.png')),
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  animationDuration:
                                      Duration(milliseconds: 400),
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
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
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
                                                            BorderRadius
                                                                .circular(15),
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
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Les Circonstances",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              child: Text(
                                "Continue",
                                style: GoogleFonts.raleway(),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  EasyLoading.showToast('Loading');
                                  try {
                                    if (_pickedImage == null) {
                                      EasyLoading.showError(
                                          "Svp prendre une photo aprés l'accident");
                                    } else {
                                      final ref = FirebaseStorage.instance
                                          .ref()
                                          .child(user!.uid.toString() + '.jpg');
                                      await ref.putFile(_pickedImage!);
                                      imageUrl = await ref.getDownloadURL();
                                      EasyLoading.showInfo(imageUrl!);
                                      await FirebaseFirestore.instance
                                          .collection('utilisateur')
                                          .doc(user!.uid)
                                          .collection('les accidents')
                                          .doc(user!.uid)
                                          .set({
                                        "Vehicule A": [
                                          {
                                            "Nom assurance": nom_assurance,
                                            "police d'assurance":
                                                police_dassurance,
                                            "agence": agence,
                                            "valable du": valable_du,
                                            "valable_au": valable_au,
                                            "C nom": C_nom,
                                            "C prenom": C_prenom,
                                            "C addresse": C_addresse,
                                            "C num permis": C_numPermis,
                                            "C_permisDeli": C_permisDeli,
                                            "A nom": A_nom,
                                            "A prenom": A_prenom,
                                            "A addresse": A_addresse,
                                            "A_tel": A_tel,
                                            "V marque": V_marque,
                                            "V imma": V_imma,
                                            "V sens suivi": V_sens_suivi,
                                            "V venant": V_venant,
                                            "V allant": V_allant,
                                            "point du choc initial":
                                                dropdownValue
                                          }
                                        ]
                                      });
                                    }
                                  } catch (ex) {
                                    print(ex);
                                  }
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                }
                              },
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
