import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../Core/Widgets/TextWidget.dart';
import '../../../translations/locale_keys.g.dart';
import 'Views/DisplayChildHomeworkView/DisplayChildHomeworkViewBody.dart';


class DisplayChildHomeworkView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFF3B3D6D) ,
        title: TextWidget(
          text: LocaleKeys.All_My_Children.tr(),
          color:const Color(0xFF7DA4FF),
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily:"Outfit",
        ),
      ),
      backgroundColor:Colors.white,
      body:DisplayChildHomeworkViewBody(),
    );
  }
}
