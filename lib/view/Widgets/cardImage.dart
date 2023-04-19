import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardImage extends StatelessWidget {
  const CardImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Device.screenType == ScreenType.mobile ? Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  shadowColor: Colors.black,
                  color: Colors.white,
                  elevation: 15,
                  child: Container(
                    constraints: BoxConstraints(
                  minHeight: 50, minWidth: 35),
                    height: 200/1.8,
                    width: 125/1.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: const DecorationImage(
                            image: AssetImage("assets/card.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ):Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  shadowColor: Colors.black,
                  color: Colors.white,
                  elevation: 15,
                  child: Container(
                    constraints: BoxConstraints(
                  minHeight: 50, minWidth: 35),
                    height: 200,
                    width: 125,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: const DecorationImage(
                            image: AssetImage("assets/card.jpg"),
                            fit: BoxFit.cover)),
                  ),
                );
  }
}