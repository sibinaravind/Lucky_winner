import 'dart:async';
import 'package:card_game/utils.dart/utils.dart';
import 'package:card_game/view/loginsplash.dart';
import 'package:card_game/view/resultSplash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../Widgets/widgets.dart';
import 'package:audioplayers/audioplayers.dart';

import '../secondLevel/levelInfo2.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final musicplayer = AudioCache();
  final textcont = Get.put(TextController());
  int player = 1;
  int wh = 1;
  bool buttondis = false;
  int index = -1;
  List cards = [
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "110",
    "111",
    "112",
    "113",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "210",
    "211",
    "212",
    "213",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "310",
    "311",
    "312",
    "313",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "410",
    "411",
    "412",
    "413"
  ];
  @override
  void initState() {
    super.initState();
    textcont.player1.value = "999";
    textcont.player2.value = "999";
    textcont.buttondis.value = false;
    cards.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.maincolor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Profile(
                    name: "Me",
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Stack(alignment: Alignment.center, children: [
                          Obx(
                            () => Align(
                                alignment: Alignment.centerLeft,
                                child: CardDisplay(
                                    value: textcont.player1.string)),
                          ),
                          Obx(() => Align(
                                alignment: Alignment.centerRight,
                                child:
                                    CardDisplay(value: textcont.player2.string),
                              )),
                          CardImage(),
                          Obx(
                            () => AnimatedOpacity(
                                opacity: textcont.visible2.isTrue ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 0),
                                child: AnimatedAlign(
                                    alignment: textcont.selected2.isTrue
                                        ? AlignmentDirectional.center
                                        : AlignmentDirectional.centerEnd,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastOutSlowIn,
                                    child: CardImage())),
                          ),
                          Obx(
                            () => AnimatedOpacity(
                                opacity: textcont.visible1.isTrue ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 0),
                                child: AnimatedAlign(
                                    alignment: textcont.selected1.isTrue
                                        ? AlignmentDirectional.center
                                        : AlignmentDirectional.centerStart,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastOutSlowIn,
                                    child: CardImage())),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Profile(name: "player2")
                ],
              ),
            ),
            Obx(
              () => !textcont.buttondis.value
                  ? InkWell(
                      onTap: (() => textcont.buttondis.value
                          ? null
                          : {
                              textcont.buttondis.toggle(),
                              startPlay(),
                            }),
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.backgroundColor,
                        ),
                        child: const Center(
                          child: Text(
                            "Play",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 50,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  startPlay() async {
    for (int i = 0; i < 2; i++) {
      index++;
      // print(index);
      await Future.delayed(Duration(seconds: 1), () {
        player == 1 ? textcont.selected1.toggle() : textcont.selected2.toggle();
        musicplayer.play('music.mp3');
      });
      await Future.delayed(Duration(seconds: 1), () {
        player == 1
            ? textcont.player1.value = cards[index]
            : textcont.player2.value = cards[index];
      });
      await Future.delayed(Duration(seconds: 1), () {
        player == 1 ? textcont.visible1.toggle() : textcont.visible2.toggle();
        player == 1 ? textcont.selected1.toggle() : textcont.selected2.toggle();
      });
      await Future.delayed(Duration(seconds: 1), () {
        player == 1 ? textcont.visible1.toggle() : textcont.visible2.toggle();
        if (cards[index].substring(1) == "11") {
          player == 1
              ? Get.offAll(LevelInfo2())
              : Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultSplash(result: false)));
        }

        player = player == 1 ? 2 : 1;
      });
      if (cards[index].substring(1) == "11") {
        break;
      }
      if (i == 1) {
        textcont.buttondis.toggle();
      }
    }
  }

  // cardplay() async {
  //   for (int i = 0; i < 52; i++) {
  //     Future.delayed(Duration(seconds: 1 + 5 * i), () {
  //       player == 1 ? textcont.selected1.toggle() : textcont.selected2.toggle();
  //       musicplayer.play('music.mp3');
  //     });
  //     Future.delayed(Duration(seconds: 2 + 5 * i), () {
  //       player == 1
  //           ? textcont.player1.value = cards[i]
  //           : textcont.player2.value = cards[i];
  //     });
  //     Future.delayed(Duration(seconds: 4 + 5 * i), () {
  //       player == 1 ? textcont.visible1.toggle() : textcont.visible2.toggle();
  //       player == 1 ? textcont.selected1.toggle() : textcont.selected2.toggle();
  //     });
  //     Future.delayed(Duration(seconds: 5 + 5 * i), () {
  //       player == 1 ? textcont.visible1.toggle() : textcont.visible2.toggle();
  //       if (cards[i].substring(1) == "11") {
  //         Navigator.pushReplacement(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) =>
  //                     ResultSplash(result: player == 1 ? false : true)));
  //       }
  //       player = player == 1 ? 2 : 1;
  //     });
  //     if (cards[i].substring(1) == "11") {
  //       break;
  //     }
  //   }
  // }
}
