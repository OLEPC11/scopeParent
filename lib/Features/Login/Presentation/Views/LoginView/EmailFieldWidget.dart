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
  TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  CustomTextFormFieldWidget(
      onChanged: (value){
        BlocProvider.of<LoginCubit>(context).email=value;
      },
      obscureText: false,
      controller: emailController,
      hintText: LocaleKeys.Enter_Email.tr(),
      icon: const Icon(Icons.email, color: Color(0xFF7DA4FF),),
      validator: (value){
        bool emailValid=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&' *+ - /=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
        BlocProvider.of<LoginCubit>(context).email=emailController.text;
        if(value.isEmpty){
          return LocaleKeys.Enter_Email.tr();
        } else if(!emailValid){
          return LocaleKeys.Enter_Valid_Email.tr();
        }},
    );
  }
}
