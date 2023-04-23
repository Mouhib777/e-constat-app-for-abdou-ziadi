import 'package:e_constat/constant/constant.dart';
import 'package:e_constat/providers/locationProvider.dart';
import 'package:e_constat/screens/loginRegistre.dart';
import 'package:e_constat/screens/paint.dart';
import 'package:e_constat/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LocationProvider())],
      child: MyApp()));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color myColor = secondaryColor;

    MaterialColor myThemeColor = MaterialColor(
      myColor.value,
      <int, Color>{
        50: myColor.withOpacity(0.1), // Define shades for the color (50 to 900)
        100: myColor.withOpacity(0.2),
        200: myColor.withOpacity(0.3),
        300: myColor.withOpacity(0.4),
        400: myColor.withOpacity(0.5),
        500: myColor.withOpacity(0.6),
        600: myColor.withOpacity(0.7),
        700: myColor.withOpacity(0.8),
        800: myColor.withOpacity(0.9),
        900: myColor.withOpacity(1.0),
      },
    );
    ThemeData myTheme = ThemeData(
      primarySwatch: myThemeColor,
    );
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: 'E-constat By A.ziadi',
      home: paintScreen(),
      theme: myTheme,
      //routes: {"/loginRegistre": (context) => loginRegistre()},
    );
  }
}
