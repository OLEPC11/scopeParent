import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget{

  TextWidget({
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    this.fontFamily,
  });
  String text;
  Color color;
  double fontSize;
  FontWeight fontWeight;
  String? fontFamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
  }
}