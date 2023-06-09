import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:e_constat/constant/constant.dart';

import 'package:e_constat/screens/option.dart';

import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:native_screenshot/native_screenshot.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math';

class signatureB extends StatefulWidget {
  const signatureB({super.key});

  @override
  State<signatureB> createState() => _signatureBState();
}

class _signatureBState extends State<signatureB> {
  final Random _random = Random();

  String generateRandomName(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(_random.nextInt(chars.length))));
  }

  String? imageUrl1;

  File? croquis_capture;

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
          title: FadeIn(
            child: Text(
              "Signature B",
              style: GoogleFonts.raleway(
                  letterSpacing: 3, fontWeight: FontWeight.w500),
            ),
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
                                  signatureB()));
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
                      // EasyLoading.showToast("En cours...");
                      // String? croquis = await NativeScreenshot.takeScreenshot();
                      // if (croquis != null) {
                      //   setState(() {
                      //     croquis_capture = File(croquis);
                      //   });
                      //   final randomName = generateRandomName(10);

                      EasyLoading.showSuccess(
                          "E-constat a été crée et envoyé avec succées");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => optionScreen(),
                          ));
                      // } else {
                      //   print("erreur");
                      //   EasyLoading.showError('Erreur');
                      // }
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
