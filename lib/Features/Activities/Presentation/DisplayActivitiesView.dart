import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../Core/Widgets/TextWidget.dart';
import '../../../translations/locale_keys.g.dart';
import 'Views/DisplayActivitiesView/DisplayActivitiesViewBody.dart';

class  DisplayActivitiesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFFD4E7FE),
        title: TextWidget(
          text: LocaleKeys.Activities.tr(),
          color:const Color(0xFF7DA4FF),
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: "Outfit",
        ),
      ),
      backgroundColor: Colors.white,
      body: DisplayActivitiesViewBody(),
    );
  }
}
