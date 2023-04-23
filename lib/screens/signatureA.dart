import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_constat/constant/constant.dart';
import 'package:e_constat/screens/homeScreen.dart';
import 'package:e_constat/screens/option.dart';
import 'package:e_constat/screens/signatureB.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:native_screenshot/native_screenshot.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math';

class signatureA extends StatefulWidget {
  const signatureA({super.key});

  @override
  State<signatureA> createState() => _signatureAState();
}

class _signatureAState extends State<signatureA> {
  final Random _random = Random();

  String generateRandomName(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(_random.nextInt(chars.length))));
  }

  String? imageUrl1;

  File? croquis_capture;
  User? user = FirebaseAuth.instance.currentUser;

  final _strokes = <Path>[];
  void _startStroke(double x, double y) {
    _strokes.add(Path()..moveTo(x, y));
  }

  void _moveStroke(double x, double y) {
    setState(() {
      _strokes.last.lineTo(x, y);
    });
  }

  @override
  void initState() {
    Permission.storage.request();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Signature A",
            style: GoogleFonts.raleway(
                letterSpacing: 3, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.75,
                child: GestureDetector(
                  onPanDown: (details) => _startStroke(
                    details.localPosition.dx,
                    details.localPosition.dy,
                  ),
                  onPanUpdate: (details) => _moveStroke(
                      details.localPosition.dx, details.localPosition.dy),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: thirdColor,
                    child: CustomPaint(
                      painter: DrawingPainter(_strokes),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          transitionDuration: Duration.zero,
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  signatureA()));
                    },
                    child: Text(
                      "effacer tout",
                      style: GoogleFonts.raleway(letterSpacing: 3),
                    )),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      EasyLoading.showToast("En cours...");
                      String? croquis = await NativeScreenshot.takeScreenshot();
                      if (croquis != null) {
                        setState(() {
                          croquis_capture = File(croquis);
                        });
                        final randomName = generateRandomName(10);
                        final ref = FirebaseStorage.instance
                            .ref()
                            .child('les signature')
                            .child(randomName + '.jpg');
                        await ref.putFile(croquis_capture!);
                        imageUrl1 = await ref.getDownloadURL();
                        await FirebaseFirestore.instance
                            .collection("utilisateur")
                            .doc(user!.uid)
                            .collection("les accidents")
                            .doc(user!.uid)
                            .update({"croquis de l'acccident": imageUrl1});
                        EasyLoading.showSuccess(
                            "E-constat a été crée et envoyé avec succées");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => signatureB(),
                            ));
                      } else {
                        print("erreur");
                        EasyLoading.showError('Erreur');
                      }
                    },
                    child: Text(
                      "Envoyer le croquis",
                      style: GoogleFonts.raleway(letterSpacing: 2),
                    )),
              ],
            ),
          ],
        ));
  }
}

class DrawingPainter extends CustomPainter {
  final List<Path> strokes;
  DrawingPainter(this.strokes);
  @override
  void paint(Canvas canvas, Size size) {
    for (final stroke in strokes) {
      final paint = Paint()
        ..strokeWidth = 3
        ..color = primaryColor
        ..style = PaintingStyle.stroke;

      canvas.drawPath(stroke, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
