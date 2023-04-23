import 'package:e_constat/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class paintScreen extends StatefulWidget {
  const paintScreen({super.key});

  @override
  State<paintScreen> createState() => _paintScreenState();
}

class _paintScreenState extends State<paintScreen> {
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CustomPaint(
          painter: DrawingPainter(),
        ),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<Path> strokes;
  DrawingPainter(this.strokes);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 10
      ..color = primaryColor
      ..style = PaintingStyle.stroke;

    final samplePath = Path()
      ..moveTo(100, 100)
      ..lineTo(300, 300);
    canvas.drawPath(samplePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
