import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scope_parent/Core/Widgets/CustomWidgets/CustomTextFormFieldWidget.dart';

import '../../../../../translations/locale_keys.g.dart';

class  AnswerTextFormFieldWidget extends StatelessWidget{
  AnswerTextFormFieldWidget({
    required this.controller,
    this.onChanged,
  });

  TextEditingController controller=TextEditingController();
  Function(String value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return  CustomTextFormFieldWidget(
      onChanged:onChanged,
      obscureText: false,
      controller: controller,
      hintText: LocaleKeys.Enter_The_Answer.tr(),
      icon: const Icon(
        Icons.question_answer,
        color: Color(0xFF7DA4FF),
        size: 20,
      ),
      validator: (value){
        if(value!.isEmpty){
          return(LocaleKeys.Enter_The_Answer.tr());
        }},
    );
  }
}
