import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../Core/Widgets/TextWidget.dart';
import '../../../translations/locale_keys.g.dart';
import 'Views/DisplayAppointmentStateView/DisplayAppointmentStateViewBody.dart';
class DisplayAppointmentStateView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFF3B3D6D) ,
        title: TextWidget(
          text:LocaleKeys.Appointments.tr(),
          color:const Color(0xFF7DA4FF),
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: "Outfit",
        ),
      ),
      backgroundColor: Colors.white,
      body: DisplayAppointmentStateViewBody(),
    );
  }
}
