import 'package:flutter/material.dart';
import 'package:scope_parent/Core/Widgets/CustomWidgets/ContainerWidget.dart';
import 'package:scope_parent/Core/Widgets/TextWidget.dart';
import 'package:scope_parent/Features/Homework/Data/Model/HomeworkModel.dart';

class  HomeworkItemWidget extends StatelessWidget {
  HomeworkItemWidget({required this.homeworkModel});
  HomeworkModel homeworkModel;
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 30,),
      width: 220, height: 250,
      widget: Stack(
        children: [
          Positioned(
            top: 10, left: 20, right: 210,
            child:TextWidget(
              text: "Homework",
              color:const Color(0xFF7DA4FF),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          const Positioned(
              top: 65, left: 10,
              child: Icon(Icons.calendar_today_outlined ,size: 20,color: Color(0xFFAC8FCF),)
          ),
          Positioned(
            top: 65, left: 70, right: 130,
            child: TextWidget(
              text: homeworkModel.day+"   "+homeworkModel.date,
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          const Positioned(
              top: 110,
              left: 12,
              child: Icon(Icons.subject ,size: 22,color: Color(0xFFAC8FCF),)
          ),
          Positioned(
            top: 110, left: 70, right: 160,
            child: TextWidget(
              text: homeworkModel.subject,
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          const Positioned(
              top: 155, left: 10,
              child: Icon(Icons.description ,size: 25,color: Color(0xFFAC8FCF),)
          ),
          Positioned(
            top: 155, left: 70, right: 20,
            child: TextWidget(
              text: homeworkModel.homework,
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
        ],
      ),
    );
  }
}














