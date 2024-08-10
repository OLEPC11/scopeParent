import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../Core/Widgets/TextWidget.dart';
import '../../../translations/locale_keys.g.dart';
import 'Views/DisplayChildInvoicesView/DisplayChildInvoicesViewBody.dart';


class DisplayChildInvoicesView extends StatelessWidget {
  const DisplayChildInvoicesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD4E7FE),
        title: TextWidget(
          text: LocaleKeys.All_Invoices.tr(),
          color:const Color(0xFF7DA4FF),
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily:"Outfit",
        ),
      ),
      backgroundColor:Colors.white,
      body:DisplayChildInvoicesViewBody(),
    );
  }
}
