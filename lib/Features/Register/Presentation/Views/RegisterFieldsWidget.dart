import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Core/Widgets/CustomWidgets/CustomTextFormFieldWidget.dart';
import 'package:scope_parent/Features/Register/Cubit/RegisterCubit.dart';

import '../../../../translations/locale_keys.g.dart';
import 'RegisterButtonWidget.dart';


class  RegisterFieldsWidget extends StatefulWidget {
  final formField;
  RegisterFieldsWidget({
    required this.formField,
  });
  @override
  State< RegisterFieldsWidget> createState()=>_RegisterFieldsWidgetState(
    formField:this.formField,
  );
}
class _RegisterFieldsWidgetState extends State< RegisterFieldsWidget>{
  _RegisterFieldsWidgetState({
    required this.formField,
  });
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passWordController=TextEditingController();
  bool passToggle=true;
  final formField;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RegisterCubit>(context).firstName=firstNameController.text;
    BlocProvider.of<RegisterCubit>(context).lastName=lastNameController.text;
    BlocProvider.of<RegisterCubit>(context).phoneNumber=phoneNumberController.text;
    BlocProvider.of<RegisterCubit>(context).email=emailController.text;
    BlocProvider.of<RegisterCubit>(context).password=passWordController.text;
    return Stack(
      children: [
        Positioned(
          top:40, left: 20, right: 20,
          child: CustomTextFormFieldWidget(
            onChanged: (value){
              BlocProvider.of<RegisterCubit>(context).firstName=value;
            },
            obscureText: false,
            controller: firstNameController,
            hintText: LocaleKeys.Enter_First_Name.tr(),
            icon: const Icon(Icons.person, color: Color(0xFF7DA4FF),),
            validator: (value){
              if(value!.isEmpty){
                return(LocaleKeys.Enter_First_Name.tr());
              }},
          ),
        ),
        Positioned(
          top:120, left: 20, right: 20,
          child:  CustomTextFormFieldWidget(
            onChanged: (value){
              BlocProvider.of<RegisterCubit>(context).lastName=value;
            },
            obscureText: false,
            controller: lastNameController,
            hintText: LocaleKeys.Enter_Last_Name.tr(),
            icon: const Icon(
              Icons.person ,
              color: Color(0xFF7DA4FF),
            ),
            validator: (value){
              if(value!.isEmpty){
                return(LocaleKeys.Enter_Last_Name.tr());
              }},
          ),
        ),
        Positioned(
          top:200, left: 20, right: 20,
          child:  CustomTextFormFieldWidget(
            onChanged: (value){
              BlocProvider.of<RegisterCubit>(context).phoneNumber=value;
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
              }},
          ),
        ),
        Positioned(
          top: 280, left: 20, right: 20,
          child:CustomTextFormFieldWidget(
            onChanged: (value){
              BlocProvider.of<RegisterCubit>(context).email=value;
            },
            obscureText: false,
            controller: emailController,
            hintText: LocaleKeys.Enter_Email.tr(),
            icon: const Icon(Icons.email, color: Color(0xFF7DA4FF),),
            validator: (value){
              bool emailValid=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&' *+ - /=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
              if(value.isEmpty){
                return LocaleKeys.Enter_Email.tr();
              } else if(!emailValid){
                return LocaleKeys.Enter_Valid_Email.tr();
              }},
          ),
        ),
        Positioned(
          top: 360, left: 20, right: 20,
          child:  CustomTextFormFieldWidget(
            onChanged: (value){
              BlocProvider.of<RegisterCubit>(context).password=value;
            },
            obscureText: passToggle,
            controller: passWordController,
            hintText: LocaleKeys.Enter_Password.tr(),
            icon: const Icon(Icons.lock, color: Color(0xFF7DA4FF),),
            suffixIcon: InkWell(
              onTap:(){
                setState(() {
                  passToggle=!passToggle;
                });},
              child: Icon(passToggle? Icons.visibility: Icons.visibility_off, color: const Color(0xFF7DA4FF),),
            ),
            validator: (value){
              if(value!.isEmpty){
                return LocaleKeys.Enter_Password.tr();
              }
              else if(passWordController.text.length<6){
                return LocaleKeys.Password_Length_Should_not_be_less_than_6_characters.tr();
              }},
          ),
        ),
        Positioned(
          top:440, left: 30, right: 30,
          child:RegisterButtonWidget(
            formField:formField ,
          ),
        ),
      ],
    );
  }
}
