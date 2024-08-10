import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../Core/Widgets/TextWidget.dart';
import '../../../translations/locale_keys.g.dart';
import 'Views/DisplayAttendanceChildView/DisplayAttendanceChildViewBody.dart';


class DisplayAttendanceChildView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD4E7FE),
        title: TextWidget(
          text: LocaleKeys.Attendance_For_My_Child.tr(),
          color:const Color(0xFF7DA4FF),
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily:"Outfit",
        ),
      ),
      backgroundColor:Colors.white,
      body:DisplayAttendanceChildViewBody(),
    );
  }
}
