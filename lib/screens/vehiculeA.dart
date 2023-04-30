import 'dart:io';
import 'dart:math';

import 'package:animate_do/animate_do.dart';

import 'package:e_constat/constant/constant.dart';
import 'package:e_constat/screens/vehiculeB.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  final Random _random = Random();

  String generateRandomName(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(_random.nextInt(chars.length))));
  }

  final ImagePicker _picker = ImagePicker();

  ImagePicker? imagePicker;
  File? _pickedImage;
  String? imageUrl;
  String? _nom_assurance;
  String? _police_dassurance;
  String? _agence;
  String? _valable_du;
  String? _valable_au;
  String? _C_nom;
  String? _C_prenom;
  String? _C_addresse;
  String? _C_numPermis;
  String? _C_permisDeli;
  String? _A_nom;
  String? _A_prenom;
  String? _A_addresse;
  String? _A_tel;
  String? _V_marque;
  String? _V_imma;
  String? _V_sens_suivi;
  String? _V_venant;
  String? _V_allant;
  String? _A_observations;
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
                        child: Column(
                      children: <Widget>[
                        Text(
                          "Societé d'assurance",
                          style:
                              GoogleFonts.raleway(fontWeight: FontWeight.w600),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _nom_assurance = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Véhicule assuré par',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Svp donner le nom de votre assurance';
                            } else {
                              setState(() {
                                _nom_assurance = value;
                              });
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _police_dassurance = value;
                          },
                          decoration: InputDecoration(
                              labelText: "Police d'assurance N°",
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else {
                              setState(() {
                                _police_dassurance = value;
                              });
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _agence = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Agence',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else {
                              setState(() {
                                _agence = value;
                              });
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _valable_du = value;
                          },
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                child: Icon(Icons.calendar_month),
                              ),
                              labelText: 'Attestation valable du',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else {
                              setState(() {
                                _valable_du = value;
                              });
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _valable_au = value;
                          },
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                child: Icon(Icons.calendar_month),
                              ),
                              labelText: 'Attestation valable au',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else {
                              setState(() {
                                _valable_au = value;
                              });
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
                          onChanged: (value) {
                            _C_nom = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Nom',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else {
                              setState(() {
                                _C_nom = value;
                              });
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _C_prenom = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Prénom',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else {
                              setState(() {
                                _C_nom = value;
                              });
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _C_addresse = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Addresse',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else {
                              setState(() {
                                _C_addresse = value;
                              });
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _C_numPermis = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Permis de conduire N°',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else {
                              setState(() {
                                _C_numPermis = value;
                              });
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _C_permisDeli = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Délivré le',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else {
                              setState(() {
                                _C_permisDeli = value;
                              });
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
                          onChanged: (value) {
                            _A_nom = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Nom',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else {
                              setState(() {
                                _A_nom = value;
                              });
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _A_prenom = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Prénom',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else {
                              setState(() {
                                _A_prenom = value;
                              });
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _A_addresse = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Addresse',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else {
                              setState(() {
                                _A_addresse = value;
                              });
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _A_tel = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Tél,',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else {
                              setState(() {
                                _A_tel = value;
                              });
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
                          onChanged: (value) {
                            _V_marque = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Marque',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else {
                              setState(() {
                                _V_marque = value;
                              });
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _V_imma = value;
                          },
                          decoration: InputDecoration(
                              labelText: "N° d'immatriculation",
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else {
                              setState(() {
                                _V_imma = value;
                              });
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _V_sens_suivi = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Sens suivi',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else {
                              setState(() {
                                _V_sens_suivi = value;
                              });
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _V_venant = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Venant a',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else {
                              setState(() {
                                _V_venant = value;
                              });
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _V_allant = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Allant a ',
                              labelStyle: GoogleFonts.raleway()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            } else {
                              setState(() {
                                _V_allant = value;
                              });
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
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Les Observations",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              _A_observations = value;
                            },
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              hintText: 'Observations',
                              hintStyle: GoogleFonts.raleway(
                                letterSpacing: 14,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(16),
                            ),
                          ),
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
                            EasyLoading.showToast(
                                'Stocker les données en cours...');

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VehiculeB(),
                                ));

                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
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
