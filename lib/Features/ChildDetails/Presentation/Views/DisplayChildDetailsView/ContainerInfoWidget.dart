import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../Core/Widgets/TextWidget.dart';

class ContainerInfoWidget extends StatelessWidget{

  ContainerInfoWidget({
    required this.icon,
    required this.info,
    required this.details,
  });
  String details;
  String info;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, width: 350,
      padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow:[
          BoxShadow(
            color:  Color(0xFFAC8FCF),
            blurRadius: 10,
            offset:  Offset(2,2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 10,
            child:Icon(color:const Color(0xFF7DA4FF),size:30 ,icon),
          ),
          Positioned(
            left: 50,
            top: 10,
            right: 20,
            child:
            TextWidget(
              text: info,
              color: const Color(0xFF7DA4FF),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Outfit',
            ),
          ),
          const Positioned(
            left: 20,
            top: 60,
            child:Icon(color:Color(0xFF7DA4FF),size:30 ,Icons.question_answer),
          ),
          Positioned(
            left: 60,
            right: 20,
            top: 60,
            child:TextWidget(
              text: details,
              color: const Color(0xFF7DA4FF),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Outfit',
            ),
          ),
        ],
      ),
    );
  }
}
