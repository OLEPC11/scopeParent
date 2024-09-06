import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../Core/Widgets/TextWidget.dart';
import '../../../translations/locale_keys.g.dart';
import 'Views/ShowRegistrationRequestStateView/ShowRegistrationRequestStateBodyView.dart';

class ShowRegistrationRequestStateView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFF3B3D6D) ,
        title: TextWidget(
          text:LocaleKeys.Registration_Request.tr(),
          color:const Color(0xFF7DA4FF),
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: "Outfit",
        ),
      ),
      backgroundColor: Colors.white,
      body: ShowRegistrationRequestStateBodyView(),
    );
  }
}
