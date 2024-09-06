import 'package:flutter/material.dart';

class TextForImageWidget extends StatelessWidget{

  TextForImageWidget({
    required this.text,
  });
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF7DA4FF),
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "Outfit",
        ),
      ),
    );
  }
}