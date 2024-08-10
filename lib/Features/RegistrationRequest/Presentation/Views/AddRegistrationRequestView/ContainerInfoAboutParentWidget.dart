import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Core/Widgets/CustomWidgets/CustomTextFormFieldWidget.dart';
import '../../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../Core/Widgets/CustomWidgets/ContainerWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../Cubit/AddRegistrationRequestCubit.dart';

class  ContainerInfoAboutParentWidget extends StatelessWidget {


  final fatherNameController=TextEditingController();
  final fatherQualificationController=TextEditingController();
  final fatherWorkController=TextEditingController();
  final motherNameController=TextEditingController();
  final motherQualificationController=TextEditingController();
  final motherWorkController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    // fatherNameController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).nameFather ?? '';
    // fatherQualificationController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).fatherAcademicQualification ?? '';
    // fatherWorkController.text= BlocProvider.of<AddRegistrationRequestCubit>(context).fatherWork ?? '';
    // motherNameController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).nameMother ?? '';
    // motherQualificationController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).motherAcademicQualification ?? '';
    // motherWorkController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).motherWork ?? '';
    return  ContainerWidget(
      padding: const EdgeInsets.only(top:50,left: 20,right: 20),
      height:550, width:220,
      widget: Stack(
        children: [
          Positioned(
            top: 10,
            left: 20,right: 20,
            child:TextWidget(
              text:LocaleKeys.Info_About_Parent.tr(),
              color:const Color(0xFF7DA4FF),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          Positioned(
            top:60, left: 20, right: 20,
            child: CustomTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).nameFather=value;
              },
              obscureText: false,
              controller: fatherNameController,
              hintText: LocaleKeys.Enter_Father_Name.tr(),
              icon: const Icon(
                Icons.person,
                color: Color(0xFF7DA4FF),
                size: 20,
              ),
              validator: (value){
                if(value!.isEmpty){
                  return(LocaleKeys.Enter_Father_Name.tr());
                }},
            ),
          ),
          Positioned(
            top:140, left: 20, right: 20,
            child: CustomTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).fatherAcademicQualification=value;
              },
              obscureText: false,
              controller: fatherQualificationController,
              hintText: LocaleKeys.Enter_Father_Qualification.tr(),
              icon: const Icon(
                Icons.school,
                color: Color(0xFF7DA4FF),
                size: 20,
              ),
              validator: (value){
                if(value!.isEmpty){
                  return(LocaleKeys.Enter_Father_Qualification.tr());
                }},
            ),
          ),
          Positioned(
            top:220, left: 20, right: 20,
            child: CustomTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).fatherWork=value;
              },
              obscureText: false,
              controller:fatherWorkController,
              hintText: LocaleKeys.Enter_Father_Work.tr(),
              icon: const Icon(
                Icons.work ,
                color: Color(0xFF7DA4FF),
                size: 20,
              ),
              validator: (value){
                if(value!.isEmpty){
                  return(LocaleKeys.Enter_Father_Work.tr());
                }},
            ),
          ),
          Positioned(
            top:300, left: 20, right: 20,
            child:  CustomTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).nameMother=value;
              },
              obscureText: false,
              controller:motherNameController ,
              hintText:LocaleKeys.Enter_Mother_Name.tr(),
              icon: const Icon(
                Icons.person,
                color: Color(0xFF7DA4FF),
                size: 20,
              ),
              validator: (value){
                if(value!.isEmpty){
                  return(LocaleKeys.Enter_Mother_Name.tr());
                }},
            ),
          ),
          Positioned(
            top:380, left: 20, right: 20,
            child:CustomTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).motherAcademicQualification=value;
              },
              obscureText: false,
              controller: motherQualificationController,
              hintText:LocaleKeys.Enter_Mother_Qualification.tr(),
              icon: const Icon(
                Icons.school,
                color: Color(0xFF7DA4FF),
                size: 20,
              ),
              validator: (value){
                if(value!.isEmpty){
                  return(LocaleKeys.Enter_Mother_Qualification.tr());
                }},
            ),
          ),
          Positioned(
            top:460, left: 20, right: 20,
            child:CustomTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).motherWork=value;
              },
              obscureText: false,
              controller:motherWorkController ,
              hintText:LocaleKeys.Enter_Mother_Work.tr(),
              icon: const Icon(
                Icons.work,
                color: Color(0xFF7DA4FF),
                size: 20,
              ),
              validator: (value){
                if(value!.isEmpty){
                  return(LocaleKeys.Enter_Mother_Work.tr());
                }},
            ),
          ),
        ],
      ),
    );
  }
}
