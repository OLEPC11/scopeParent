import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../translations/locale_keys.g.dart';

class  LoginTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text:LocaleKeys.Welcome_Login_Now.tr(),
      color: const Color(0xFF7DA4FF),
      fontSize: 25,
      fontWeight: FontWeight.bold,
      fontFamily: "Outfit",
    );
  }
}
