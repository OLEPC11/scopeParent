import 'package:flutter/material.dart';
import 'package:scope_parent/Core/Widgets/TextWidget.dart';
import 'package:scope_parent/Features/Home/Data/Model/RegistrationRequestStateModel.dart';


class RegistrationRequestStateItemWidget extends StatelessWidget {
  RegistrationRequestStateItemWidget({
    required this.registrationRequestStateModel,
  });
  RegistrationRequestStateModel registrationRequestStateModel;
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
                const SizedBox(
                  width: 20,
                ),
                const Icon(Icons.calendar_today),
                const SizedBox(
                  width: 10,
                ),
                TextWidget(
                  text: registrationRequestStateModel.date,
                  color:const Color(0xFF7DA4FF),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit",
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                const SizedBox(width: 60,),
                const Icon(Icons.person),
                const SizedBox(width: 20,),
                TextWidget(
                  text: registrationRequestStateModel.studentName,
                  color:const Color(0xFF7DA4FF),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit",
                ),
              ],
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 120,),
              child:TextWidget(
                text: registrationRequestStateModel.status,
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
