import 'package:card_game/controller/controller.dart';
import 'package:card_game/view/loginsplash.dart';
import 'package:card_game/view/secondLevel/levelInfo2.dart';
import 'package:card_game/view/thirdLevel/levelInfo3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textcont = Get.put(TextController());
    _portraitModeOnly();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        title: 'Lucky Winner',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.green,
            textTheme:
                GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)),
        home: LoginSplash(),
      );
    });
  }
}
