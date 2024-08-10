import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../Core/Widgets/TextWidget.dart';
import '../../../translations/locale_keys.g.dart';
import 'Views/AddRegistrationRequestView/AddRegistrationRequestViewBody.dart';

class  AddRegistrationRequestView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD4E7FE),
        title: TextWidget(
          text: LocaleKeys.Add_Registration_Request.tr(),
          color:const Color(0xFF7DA4FF),
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily:"Outfit",
        ),
      ),
      backgroundColor:Colors.white,
      body:AddRegistrationRequestViewBody(),
    );
  }
}
