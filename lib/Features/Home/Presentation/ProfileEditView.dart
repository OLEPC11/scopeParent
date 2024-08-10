import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../Core/Widgets/TextWidget.dart';
import '../../../translations/locale_keys.g.dart';
import 'Views/ProfileEditView/ProfileEditViewBody.dart';

class  ProfileEditView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor:const Color(0xFF3B3D6D) ,
        backgroundColor:const Color(0xFFD4E7FE),
        title: TextWidget(
          text: LocaleKeys.Edit_Your_Profile.tr(),
          color:const Color(0xFF7DA4FF),
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: "Outfit",
        ),
      ),
      backgroundColor: Colors.white,
      body:ProfileEditViewBody(),
    );
  }
}
