import 'package:flutter/material.dart';
import '../../../../../../Core/Widgets/SizedBoxWidget.dart';

class  DisplayImageWidget extends StatelessWidget{
  DisplayImageWidget({required this.image});

  String image;
  @override
  Widget build(BuildContext context) {
    return  SizedBoxWidget(
      height: 250,
      width: 400,
      edgeInsets:  const EdgeInsets.only(top: 20,left: 40,right: 40),
      child:  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          image:DecorationImage(
            image:NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
