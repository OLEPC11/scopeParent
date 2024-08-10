import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../../Core/Widgets/TextWidget.dart';
class ChildInfoWidget extends StatelessWidget {
  ChildInfoWidget({
    required this.childImage,
    required this.childName,
    required this.type,
  });
  String childImage;
  String childName;
  String type;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top:20,left: 20,right: 20),
      child: Container(
        height:350,
        width:220,
        decoration: BoxDecoration(
          color:const Color(0xFFD4E7FE) ,
          borderRadius: BorderRadius.circular(60),
        ),
        child:  Stack(
          children: [
            Positioned(
              left:60,
              top: 20,
              bottom: 100,
              child: CircleAvatar(
                radius:130,
                backgroundImage: NetworkImage(childImage),
              ),
            ),
            Positioned(
              top:260,
              left:120,
              child:TextWidget(
                text: childName,
                color: const Color(0xFF7DA4FF),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Positioned(
              top:300,
              left:160,
              child:TextWidget(
                text: type,
                color: const Color(0xFF7DA4FF),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
