import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Core/Widgets/CustomWidgets/CustomTextFormFieldWidget.dart';
import 'package:scope_parent/Features/Login/Cubit/LoginCubit.dart';
import '../../../../../translations/locale_keys.g.dart';

class  EmailFieldWidget extends StatefulWidget {
  @override
  State<EmailFieldWidget > createState()=>_EmailFieldWidgetState();
}
class _EmailFieldWidgetState extends State<EmailFieldWidget>{
  TextEditingController phoneNumberController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  CustomTextFormFieldWidget(
      onChanged: (value){
        BlocProvider.of<LoginCubit>(context).phoneNumber=value;
      },
      obscureText: false,
      controller: phoneNumberController,
      type: TextInputType.number,
      hintText:LocaleKeys.Enter_Phone_Number.tr(),
      icon: const Icon(
        Icons.phone,
        color: Color(0xFF7DA4FF),
        size: 20,
      ),
      validator: (value){
        if(value!.isEmpty){
          return(LocaleKeys.Enter_Phone_Number.tr());
        }
        else if(phoneNumberController.text.length<6){
          return LocaleKeys.Phone_Number_Length_Should_equal_10_Numbers.tr();
        }},
    );
  }
}
