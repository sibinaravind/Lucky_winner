import 'dart:async';

import 'package:card_game/utils.dart/utils.dart';
import 'package:card_game/view/Widgets/widgets.dart';
import 'package:card_game/view/firstLevel/levelInfo1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSplash extends StatefulWidget {
  const LoginSplash({
    Key? key,
  }) : super(key: key);
  @override
  State<LoginSplash> createState() => _LoginSplashState();
}

class _LoginSplashState extends State<LoginSplash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => {Get.back(), Get.offAll(LevelInfo1())});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.maincolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BigText(
              text: "Lucky Winner",
              size: 50,
              weight: FontWeight.w900,
              color: Color.fromARGB(255, 2, 62, 55),
            ),
            Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 2,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/cards2.gif'),
                        fit: BoxFit.fill))),
          ],
        ),
      ),
    );
  }
}
