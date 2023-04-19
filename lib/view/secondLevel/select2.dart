import 'package:card_game/controller/controller.dart';
import 'package:card_game/view/Widgets/widgets.dart';
import 'package:card_game/view/secondLevel/home2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils.dart/colors.dart';

class Select2 extends StatelessWidget {
  TextController textcont = Get.find();
  Select2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.maincolor,
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              BigText(
                text: "Select Your Card",
                color: Color.fromARGB(255, 2, 62, 55),
              ),
              Wrap(
                children: [
                  for (int i = 1; i <= 13; i++)
                    GestureDetector(
                        onTap: () {
                          textcont.Player1Select.value = i;
                          Get.offAll(HomePage2());
                        },
                        child: DisplayCard(value: i - 1)),
                ],
              ),
            ],
          ),
        ));
  }
}
