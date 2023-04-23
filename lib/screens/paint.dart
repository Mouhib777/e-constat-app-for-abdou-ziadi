import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class paintScreen extends StatefulWidget {
  const paintScreen({super.key});

  @override
  State<paintScreen> createState() => _paintScreenState();
}

class _paintScreenState extends State<paintScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
