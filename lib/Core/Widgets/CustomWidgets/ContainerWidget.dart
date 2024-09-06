import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget{
  ContainerWidget({
    required this.widget,
    required this.height,
    required this.width,
    required this.padding,
  });
  Widget widget;
  double width;
  double height;
  EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:padding ,
      child:  Container(
        height:height,
        width:width,
        decoration: BoxDecoration(
          color:const Color(0xFF3B3D6D) ,
          //color:const Color(0xFFD4E7FE),
          borderRadius: BorderRadius.circular(30),
        ),
        child:widget,
      ),
    );
  }
}