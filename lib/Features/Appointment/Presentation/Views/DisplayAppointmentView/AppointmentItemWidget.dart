import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:scope_parent/Core/Widgets/CustomWidgets/CustomButtonWidget.dart';
import 'package:scope_parent/Core/Widgets/TextWidget.dart';
import '../../../../../translations/locale_keys.g.dart';

class AppointmentItemWidget extends StatelessWidget {
  AppointmentItemWidget({
    required this.date,
    required this.time,
    required this.onTap,

});

  Function() onTap;
  String date;
  String time;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color(0xFFAC8FCF),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(bottom: 20,),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/Logo.png"),
                ),
                const Icon(Icons.calendar_today),
                TextWidget(
                  text: date,
                  color:const Color(0xFF7DA4FF),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit",
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(Icons.timer),
                Expanded(
                  child: TextWidget(
                  text: time,
                  color:const Color(0xFF7DA4FF),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit",
                ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            CustomButtonWidget(
              text: LocaleKeys.Book_An_Appointment.tr(),
              onTap:onTap,
            ),
          ],
        ),
      ),
    );
  }
}
