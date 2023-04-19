import 'dart:ui';

import 'package:card_game/utils.dart/utils.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardDisplay extends StatelessWidget {
  String value;
  CardDisplay({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int number = int.parse(value.substring(1)) - 1;
    int type = int.parse(value[0]) - 1;
    Color clr = type == 0 || type == 1 ? Colors.red : Colors.black;
    List values = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"];
    List<IconData> symbols2 = [
      MdiIcons.cardsHeart,
      MdiIcons.cardsDiamond,
      MdiIcons.cardsClub,
      MdiIcons.cardsSpade
    ];

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
                          Column(
                            children: [
                              Text(
                                values[number].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 17,
                                    color: clr),
                              ),
                              Icon(symbols2[type], color: clr, size: 12)
                            ],
                          ),
                          Expanded(
                              child: Icon(
                            symbols2[type],
                            size: 18,
                            color: clr,
                          )),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(symbols2[type], color: clr, size: 12),
                                Text(
                                  values[number].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 17,
                                      color: clr),
                                ),
                              ]),
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
                                values[number].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 19,
                                    color: clr),
                              ),
                              Icon(
                                symbols2[type],
                                color: clr,
                              )
                            ],
                          ),
                          Expanded(
                              child: Icon(
                            symbols2[type],
                            size: 50,
                            color: clr,
                          )),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  symbols2[type],
                                  color: clr,
                                ),
                                Text(
                                  values[number].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 19,
                                      color: clr),
                                ),
                              ]),
                        ],
                      ),
                    )),
              );
  }
}
