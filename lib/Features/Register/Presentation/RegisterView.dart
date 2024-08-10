import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:scope_parent/Features/Register/Presentation/Views/RegisterViewBody.dart';
import '../../../../Core/Widgets/TextWidget.dart';
import '../../../translations/locale_keys.g.dart';

class  RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor:const Color(0xFF3B3D6D) ,
        backgroundColor:const Color(0xFFD4E7FE),
        title: TextWidget(
          text: LocaleKeys.Add_Your_Account.tr(),
          color:const Color(0xFF7DA4FF),
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: "Outfit",
        ),
      ),
      backgroundColor: Colors.white,
      body: RegisterViewBody(),
    );
  }
}