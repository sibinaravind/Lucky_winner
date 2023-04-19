import 'package:card_game/view/loginsplash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultSplash extends StatelessWidget {
  const ResultSplash({Key? key, required this.result}) : super(key: key);
  final bool result;
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginSplash()))
                    // Get.off((context) => LoginSplash())
                  }),
              child: result ? Text("Play Again") : Text("Retry"),
            ),
          ),
        ),
        decoration: BoxDecoration(
            // color: Color.fromARGB(86, 0, 0, 0),
            image: DecorationImage(
                image: result
                    ? AssetImage('assets/win.gif')
                    : AssetImage('assets/lost.gif'),
                fit: BoxFit.fitWidth)));
  }
}
