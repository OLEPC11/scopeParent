import 'package:flutter/material.dart';
import 'package:scope_parent/Core/Widgets/TextWidget.dart';
import 'package:scope_parent/Features/Appointment/Data/Model/AppointmentsStateModel.dart';


class AppointmentStateItemwidget extends StatelessWidget {
  AppointmentStateItemwidget({
   required this.appointmentsStateModel,
});
  AppointmentsStateModel appointmentsStateModel;
  @override
  Widget build(BuildContext context) {
    return  Card(
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
                  text: appointmentsStateModel.day,
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
                    text: appointmentsStateModel.time,
                    color:const Color(0xFF7DA4FF),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 120,),
              child:TextWidget(
                text: appointmentsStateModel.status,
                color:Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: "Outfit",
              ),
            )
          ],
        ),
      ),
    );

  }
}
