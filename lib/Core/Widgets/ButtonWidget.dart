import 'package:flutter/material.dart';
import 'TextWidget.dart';


class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    required this.height,
    required this.width,
    required this.color,
    required this.text,
    required this.onTap,
    required this.colorShadow,
    required this.fontSize,
    required this.fontWeight,
    required this.colorText,
    this.fontFamily
  });

  double height;
  double width;
  Color color;
  String text;
  Color colorShadow;
  Color colorText;
  double fontSize;
  FontWeight fontWeight;
  String? fontFamily;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
              color:colorShadow,
              blurRadius: 10,
              offset: const Offset(2,2),
            ),
          ],
        ),
        child:  Center(
          child:TextWidget(
            text: text,
            color: colorText,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
          ),
        ),
      ),
    );
  }
}