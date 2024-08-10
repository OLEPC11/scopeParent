import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../Core/Widgets/TextWidget.dart';
import '../../../translations/locale_keys.g.dart';
import 'Views/InfoForDisplayChildHomeworkView/InfoForDisplayChildHomeworkViewBody.dart';

class InfoForDisplayChildHomeworkView extends StatelessWidget {
  const InfoForDisplayChildHomeworkView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD4E7FE),
        title: TextWidget(
          text: LocaleKeys.Info_About_Child.tr(),
          color:const Color(0xFF7DA4FF),
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily:"Outfit",
        ),
      ),
      backgroundColor:Colors.white,
      body:InfoForDisplayChildHomeworkViewBody(),
    );
  }
}
