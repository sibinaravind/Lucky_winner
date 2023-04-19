import 'dart:async';

import 'package:card_game/utils.dart/utils.dart';
import 'package:card_game/view/Widgets/widgets.dart';
import 'package:card_game/view/firstLevel/home1.dart';
import 'package:card_game/view/secondLevel/select2.dart';
import 'package:card_game/view/thirdLevel/select3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LevelInfo3 extends StatefulWidget {
  const LevelInfo3({
    Key? key,
  }) : super(key: key);
  @override
  State<LevelInfo3> createState() => _LevelInfo3State();
}

class _LevelInfo3State extends State<LevelInfo3> {
  @override
  void initState() {
    super.initState();
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
              text: "Level 3",
              size: 50,
              weight: FontWeight.w900,
              color: Color.fromARGB(255, 2, 62, 55),
              // color: Color.fromARGB(255, 144, 8, 8),
            ),
            SmallText(
              text: 'Lucky On ❤ ',
              size: 35,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
              // color: Color.fromARGB(255, 144, 8, 8),
            ),
            InkWell(
              onTap: (() => {Get.offAll(Select3())}),
              child: Container(
                width: 75,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.backgroundColor,
                ),
                child: const Center(
                  child: Text(
                    "start",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
