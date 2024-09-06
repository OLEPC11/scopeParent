import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:scope_parent/Core/Widgets/TextWidget.dart';
import 'package:scope_parent/Features/Register/Presentation/RegisterView.dart';

import '../../../../../translations/locale_keys.g.dart';

class RegisterTextButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children:  [
        TextWidget(
          text: LocaleKeys.Do_not_have_an_account.tr(),
          fontFamily: "Outfit",
          fontSize: 20,
          color: const Color(0xFF7DA4FF),
          fontWeight: FontWeight.bold,
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder:(BuildContext context){
                  return RegisterView();
                }),);
          },
          child:TextWidget(
            text: LocaleKeys.Sign_Up.tr(),
            color:  const Color(0xFFAC8FCF),
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: "Outfit",
          ),
        ),
      ],
    );
  }
}
