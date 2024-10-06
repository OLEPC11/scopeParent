import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Core/Widgets/CustomWidgets/CustomTextFormFieldWidget.dart';
import 'package:scope_parent/Features/Home/Presentation/Views/ProfileEditView/ProfileEditButtonWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../Cubit/EditProfileCubit/EditProfileCubit.dart';
import '../../../Cubit/ShowProfileCubit/ShowProfileCubit.dart';

class  ProfileEditFieldsWidget extends StatefulWidget {
  @override
  State< ProfileEditFieldsWidget> createState()=>_ProfileEditFieldsWidgetState();
}
class _ProfileEditFieldsWidgetState extends State< ProfileEditFieldsWidget>{

  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passWordController=TextEditingController();
  void initState(){
    firstNameController.text=BlocProvider.of<ShowProfileCubit>(context).profileUserModel!.firstName;
    lastNameController.text=BlocProvider.of<ShowProfileCubit>(context).profileUserModel!.lastName;
    phoneNumberController.text=BlocProvider.of<ShowProfileCubit>(context).profileUserModel!.phoneNumber;
    passWordController.text=BlocProvider.of<EditProfileCubit>(context).password;
  }
  bool passToggle=true;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EditProfileCubit>(context).firstName=firstNameController.text;
    BlocProvider.of<EditProfileCubit>(context).lastName=lastNameController.text;
    BlocProvider.of<EditProfileCubit>(context).phoneNumber=phoneNumberController.text;
    BlocProvider.of<EditProfileCubit>(context).password=passWordController.text;
    return Stack(
      children: [
        Positioned(
          top:40, left: 20, right: 20,
          child: CustomTextFormFieldWidget(
            onChanged: (value){
              BlocProvider.of<EditProfileCubit>(context).firstName=value;
            },
            obscureText: false,
            controller: firstNameController,
            hintText: LocaleKeys.Enter_First_Name.tr(),
            icon: const Icon(Icons.person, color: Color(0xFF7DA4FF),),
            validator: (value){
              BlocProvider.of<EditProfileCubit>(context).firstName=firstNameController.text;
              if(value!.isEmpty){
                return(LocaleKeys.Enter_First_Name.tr());
              }},
          ),
        ),
        Positioned(
          top:120, left: 20, right: 20,
          child:  CustomTextFormFieldWidget(
            onChanged: (value){
              BlocProvider.of<EditProfileCubit>(context).lastName=value;
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
              BlocProvider.of<EditProfileCubit>(context).phoneNumber=value;
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
          child:  CustomTextFormFieldWidget(
            onChanged: (value){
              BlocProvider.of<EditProfileCubit>(context).password=value;
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
          top:380, left: 30, right: 30,
          child:ProfileEditButtonWidget(
          ),
        ),
      ],
    );
  }
}
