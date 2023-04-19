import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  FontWeight weight;
  TextDecoration decoration;
  int maxlines;
  BigText({
    Key? key,
    this.maxlines = 1,
    this.color = Colors.black,
    required this.text,
    this.decoration = TextDecoration.none,
    this.overFlow = TextOverflow.ellipsis,
    this.size = 20,
    this.weight = FontWeight.w800,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: overFlow,
        maxLines: maxlines,
        style: TextStyle(
            fontFamily: 'Roboto',
            color: color,
            fontSize: size,
            fontWeight: weight,
            decoration: decoration));
  }
}
