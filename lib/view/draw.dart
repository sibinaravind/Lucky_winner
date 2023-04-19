import 'package:card_game/view/loginsplash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawSplash extends StatelessWidget {
  const DrawSplash({Key? key, required this.page}) : super(key: key);
  final Widget page;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // ignore: sort_child_properties_last
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: ElevatedButton(
              onPressed: (() => {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => page))
                    // Get.off((context) => LoginSplash())
                  }),
              child: Text("Retry"),
            ),
          ),
        ),
        decoration: BoxDecoration(
            // color: Color.fromARGB(86, 0, 0, 0),
            image: DecorationImage(
                image: AssetImage('assets/draw.png'), fit: BoxFit.fitWidth)));
  }
}
