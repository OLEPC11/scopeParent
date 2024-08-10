import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Core/Widgets/CustomWidgets/CustomTextFormFieldWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../Cubit/LoginCubit.dart';

class  PasswordFieldWidget extends StatefulWidget {

  @override
  State<PasswordFieldWidget> createState()=>_PasswordFieldWidgetState();
}
class _PasswordFieldWidgetState extends State<PasswordFieldWidget>{

  TextEditingController passwordController=TextEditingController();
  bool passToggle=true;

  @override
  Widget build(BuildContext context) {
    return  CustomTextFormFieldWidget(
      onChanged: (value){
        BlocProvider.of<LoginCubit>(context).password=value;
      },
      obscureText: passToggle,
      controller: passwordController,
      hintText: LocaleKeys.Enter_Password.tr(),
      icon: const Icon(Icons.lock, color: Color(0xFF7DA4FF),),
      suffixIcon: InkWell(
        onTap: (){
          setState(() {
            passToggle=!passToggle;
          });},
        child: Icon(passToggle? Icons.visibility: Icons.visibility_off, color: const Color(0xFF7DA4FF),),
      ),
      validator: (value){
        BlocProvider.of<LoginCubit>(context).password=passwordController.text;
        if(value!.isEmpty){
          return LocaleKeys.Enter_Password.tr();
        }
        else if(passwordController.text.length<6){
          return LocaleKeys.Password_Length_Should_not_be_less_than_6_characters.tr();
        }},
    );
  }
}
