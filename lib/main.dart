import 'package:e_constat/constant/constant.dart';
import 'package:e_constat/screens/loginRegistre.dart';
import 'package:e_constat/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-constat By A.ziadi',
      home: splashScreen(),
      //theme: ThemeData(primarySwatch: secondaryColor),
      //initialRoute: '/',
      routes: {"/loginRegistre": (context) => loginRegistre()},
    );
  }
}
