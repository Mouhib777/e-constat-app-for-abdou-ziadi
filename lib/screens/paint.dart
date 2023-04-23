import 'package:e_constat/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:native_screenshot/native_screenshot.dart';

class paintScreen extends StatefulWidget {
  const paintScreen({super.key});

  @override
  State<paintScreen> createState() => _paintScreenState();
}

class _paintScreenState extends State<paintScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "croquis de l'accident",
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
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            paintScreen()));
                  },
                  child: Text(
                    "effacer tout",
                    style: GoogleFonts.raleway(letterSpacing: 3),
                  )),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Envoyer le croquis",
                    style: GoogleFonts.raleway(letterSpacing: 2),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<Path> strokes;
  DrawingPainter(this.strokes);
  @override
  void paint(Canvas canvas, Size size) {
    for (final stroke in strokes) {
      final paint = Paint()
        ..strokeWidth = 5
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
