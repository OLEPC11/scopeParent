import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../../Core/Widgets/TextWidget.dart';
class DisplayChildImageWidget extends StatelessWidget {
  DisplayChildImageWidget({
    required this.childImage,
  });
  String childImage;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top:20,left: 20,right: 20),
      child: CircleAvatar(
        radius:130,
        backgroundImage: NetworkImage(childImage),
      ),
    );
  }
}
