import 'dart:async';
import 'dart:math';
import 'package:card_game/utils.dart/utils.dart';
import 'package:card_game/view/draw.dart';
import 'package:card_game/view/resultSplash.dart';
import 'package:card_game/view/thirdLevel/select3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../Widgets/widgets.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage3 extends StatefulWidget {
  const HomePage3({Key? key}) : super(key: key);

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  final musicplayer = AudioCache();
  TextController textcont = Get.find();
  int player = 1;
  int wh = 1;
  bool buttondis = false;
  bool player1loose = false;
  bool player2loose = false;
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
  ];
  @override
  void initState() {
    super.initState();
    textcont.player2Select.value = Random().nextInt(13).toInt();
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 60,
                          width: 50,
                          child: FittedBox(
                              child: Display3rdCard(
                                  value: textcont.Player1Select.toInt() - 1))),
                      Profile(
                        name: "Me",
                      ),
                    ],
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 60,
                          width: 50,
                          child: FittedBox(
                              child: Display3rdCard(
                                  value: textcont.player2Select.toInt() - 1))),
                      Profile(name: "player2")
                    ],
                  )
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
        if (player == 1 &&
            cards[index].substring(1) == textcont.Player1Select.toString()) {
          // print("player1win");
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultSplash(result: true)));
        }
        if (player == 2 &&
            cards[index].substring(1) == textcont.player2Select.toString()) {
          // print("player2win");
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultSplash(result: false)));
        }
      });
      if (player == 1 &&
          cards[index].substring(1) == textcont.Player1Select.toString()) {
        break;
      }
      if (player == 2 &&
          cards[index].substring(1) == textcont.player2Select.toString()) {
        break;
      }
      if (i == 1) {
        textcont.buttondis.toggle();
      }
      if (textcont.player2Select != textcont.Player1Select &&
          player == 1 &&
          cards[index].substring(1) == textcont.player2Select.toString()) {
        player2loose = true;
        // print("player2losse");
      }
      if (textcont.player2Select != textcont.Player1Select &&
          player == 2 &&
          cards[index].substring(1) == textcont.Player1Select.toString()) {
        player1loose = true;
        // print("player1losse");
      }
      if (player1loose && player2loose) {
        Get.offAll(DrawSplash(page: Select3()));
        break;
      }
      player = player == 1 ? 2 : 1;
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
