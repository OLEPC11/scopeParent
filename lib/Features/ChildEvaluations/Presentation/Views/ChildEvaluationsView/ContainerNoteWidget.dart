import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../../Core/Widgets/TextWidget.dart';

class ContainerNoteWidget extends StatelessWidget{

  ContainerNoteWidget({
    required this.note,
  });
  String note;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(top:10,bottom: 10,),
      padding: const EdgeInsets.only(top:20,bottom: 20,left: 30,right:30),
      width: 350,
      height: 140,
      decoration: BoxDecoration(
        color: const Color(0xFFD4E7FE) ,
        borderRadius: BorderRadius.circular(30),
      ),
      child:
      Container(
        height: 100,
        width: 350,
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
        child: Padding(
          padding:const EdgeInsets.only(left: 30,right: 20,top: 10) ,
          child: TextWidget(
            text: note,
            color: const Color(0xFF7DA4FF),
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: "Outfit",
          ),
        ),
      ),
    );
  }
}
