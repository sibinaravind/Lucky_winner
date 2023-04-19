import 'dart:ui';

import 'package:card_game/utils.dart/utils.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Display3rdCard extends StatelessWidget {
  int value;
  Display3rdCard({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List values = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"];
    return value == "999"
        ? SizedBox.shrink()
        : Device.screenType == ScreenType.mobile
            ? SizedBox(
                height: 200 / 1.8,
                width: 125 / 1.8,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    shadowColor: Colors.white,
                    color: Colors.white,
                    elevation: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              values[value].toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17,
                                  color: Colors.red),
                            ),
                          ),
                          const Expanded(
                              child: Icon(
                            MdiIcons.cardsHeart,
                            size: 18,
                            color: Colors.red,
                          )),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              values[value].toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17,
                                  color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    )),
              )
            : SizedBox(
                height: 200,
                width: 125,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    shadowColor: Colors.white,
                    color: Colors.white,
                    elevation: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                values[value].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 19,
                                    color: Colors.red),
                              ),
                              Icon(
                                MdiIcons.cardsHeart,
                                color: Colors.red,
                              )
                            ],
                          ),
                          Expanded(
                              child: Icon(
                            MdiIcons.cardsHeart,
                            size: 50,
                            color: Colors.red,
                          )),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  MdiIcons.cardsHeart,
                                  color: Colors.red,
                                ),
                                Text(
                                  values[value].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 19,
                                      color: Colors.red),
                                ),
                              ]),
                        ],
                      ),
                    )),
              );
  }
}
