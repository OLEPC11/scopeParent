import 'package:flutter/material.dart';
import '../../../../../../Core/Widgets/ButtonWidget.dart';

class CustomButtonWidget extends StatelessWidget{
  CustomButtonWidget({
    required this.text,
    required this.onTap,
  });
  String text;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return  ButtonWidget(
      onTap: onTap,
      height: 50,
      width: 300,
      color: Colors.white,
      text: text,
      colorText: const Color(0xFF7DA4FF),
      colorShadow:  const Color(0xFFAD90D2) ,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: "Outfit",
    );
  }
}