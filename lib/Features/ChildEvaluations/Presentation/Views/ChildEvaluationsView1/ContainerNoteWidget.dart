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
      height: 100,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow:const [
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
    );
  }
}
