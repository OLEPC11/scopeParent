import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../../Core/Widgets/TextWidget.dart';

class NoteTextWidget extends StatelessWidget{
  NoteTextWidget({
    required this.text,
});
  String text;
  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: text,
      color: const Color(0xFF7DA4FF),
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: "Outfit",
    );
  }
}
