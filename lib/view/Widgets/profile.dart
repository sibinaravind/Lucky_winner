import 'package:card_game/utils.dart/colors.dart';
import 'package:flutter/material.dart';
class Profile extends StatelessWidget {
  String name;
   Profile({Key? key,this.name="player"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
               CircleAvatar(
                radius: 21.5,
                backgroundColor: Colors.red,
                 child: CircleAvatar(
                  backgroundColor: AppColors.backgroundColor,
                    child: Icon(
                  Icons.contacts_outlined,
                             )),
               ),
              Text(name,style: TextStyle(color: AppColors.textcolor,fontSize: 15, ),)

      ],
    );
  }
}