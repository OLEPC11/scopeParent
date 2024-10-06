import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:scope_parent/Core/Widgets/CustomWidgets/CustomTextFormFieldWidget.dart';
import 'package:scope_parent/Features/Home/Cubit/LanguageCubit/LanguageCubit.dart';
import '../../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../Core/Widgets/CustomWidgets/ContainerWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../Cubit/AddRegistrationRequestCubit.dart';
import 'ContanierRadioWidget.dart';

class  ContainerInfoAboutChildWidget extends StatefulWidget {

  @override
  State<ContainerInfoAboutChildWidget> createState()=>_ContainerInfoAboutChildWidgetState();
}
class _ContainerInfoAboutChildWidgetState extends State<ContainerInfoAboutChildWidget>{

  final childFullNameController=TextEditingController();
  final dateOfBirthController=TextEditingController();
  final placeOfBirthController=TextEditingController();
  final numberOfBrothersController=TextEditingController();
  final arrangingChildInFamilyController=TextEditingController();

  int? radioValueGender;
  String? gender;

  int? radioValueType;
  String? kg;

  @override
  Widget build(BuildContext context) {
    childFullNameController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).name ??'';
    dateOfBirthController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).dateBirth ?? '';
    placeOfBirthController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).placeBirth ?? '';
    numberOfBrothersController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).numberBrother ?? '';
    arrangingChildInFamilyController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).arrangementInFamily ?? '';
    radioValueGender = BlocProvider.of<AddRegistrationRequestCubit>(context).gender=="Male"?1:BlocProvider.of<AddRegistrationRequestCubit>(context).gender=="Female"?2:0;
    radioValueType = BlocProvider.of<AddRegistrationRequestCubit>(context).categoryId=="1"?4:BlocProvider.of<AddRegistrationRequestCubit>(context).categoryId=="2"?1: BlocProvider.of<AddRegistrationRequestCubit>(context).categoryId=="3"?2: BlocProvider.of<AddRegistrationRequestCubit>(context).categoryId=="4"?3:0;
    return ContainerWidget(
      padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
      height:720, width:220,
      widget: Stack(
        children: [
          Positioned(
            top: 10, left: 20,right: 20,
            child:TextWidget(
              text: LocaleKeys.Info_About_Child.tr(),
              color:const Color(0xFF7DA4FF),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          Positioned(
            top:60, left: 20, right: 20,
            child: CustomTextFormFieldWidget(
              onChanged:(value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).name=value;
                childFullNameController.text=BlocProvider.of<AddRegistrationRequestCubit>(context).name;
              },
              obscureText: false,
              controller: childFullNameController,
              hintText: LocaleKeys.Enter_Child_Full_Name.tr(),
              icon: const Icon(
                Icons.person,
                color: Color(0xFF7DA4FF),
                size: 20,
              ),
              validator: (value){
                if(value!.isEmpty){
                  return(LocaleKeys.Enter_Child_Full_Name.tr());
                }},
            ),
          ),
          Positioned(
            top:140,
            left: 20,
            right: 20,
            child:  CustomTextFormFieldWidget(
              onChanged:(value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).dateBirth=value;
              },
              obscureText: false,
              controller: dateOfBirthController,
              hintText:LocaleKeys.Enter_Date_Of_Birth.tr(),
              icon: const Icon(
                Icons.calendar_month,
                color: Color(0xFF7DA4FF),
                size: 20,
              ),
              onTap:  ()async{
                DateTime? pickedDate=await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2070),
                );
                if(pickedDate!=null){
                  setState(() {
                    dateOfBirthController.text=DateFormat("yyyy-MM-dd","en_US").format(pickedDate);
                    BlocProvider.of<AddRegistrationRequestCubit>(context).dateBirth=dateOfBirthController.text;
                  });
                }
              },
              validator: (value){
                if(value!.isEmpty){
                  return(LocaleKeys.Enter_Date_Of_Birth.tr());
                }},
            ),
          ),
          Positioned(
            top:220, left: 20, right: 20,
            child:  CustomTextFormFieldWidget(
              onChanged:(value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).placeBirth=value;
              },
              obscureText: false,
              controller: placeOfBirthController,
              hintText:LocaleKeys.Enter_Place_Of_Birth.tr(),
              icon: const Icon(
                Icons.location_city_rounded ,
                color: Color(0xFF7DA4FF),
                size: 20,
              ),
              validator: (value){
                if(value!.isEmpty){
                  return(LocaleKeys.Enter_Place_Of_Birth.tr());
                }},
            ),
          ),
          Positioned(
            top:300, left: 20, right: 20,
            child:  CustomTextFormFieldWidget(
              onChanged:(value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).numberBrother=value;
              },
              obscureText: false,
              controller: numberOfBrothersController,
              hintText: LocaleKeys.Enter_Number_Of_Brothers.tr(),
              icon: const Icon(
                Icons.family_restroom,
                color: Color(0xFF7DA4FF),
                size: 20,
              ),
              validator: (value){
                if(value!.isEmpty){
                  return(LocaleKeys.Enter_Number_Of_Brothers.tr());
                }},
            ),
          ),
          Positioned(
            top:380, left: 20, right: 20,
            child:CustomTextFormFieldWidget(
              onChanged:(value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).arrangementInFamily=value;
              },
              obscureText: false,
              controller: arrangingChildInFamilyController,
              hintText: LocaleKeys.Enter_Arranging_Child_In_Family.tr(),
              icon: const Icon(
                Icons.family_restroom,
                color: Color(0xFF7DA4FF),
                size: 20,
              ),
              validator: (value){
                if(value!.isEmpty){
                  return(LocaleKeys.Enter_Arranging_Child_In_Family.tr());}},
            ),
          ),
          Positioned(
            top: 450, left: 20, right: 20,
            child:Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text: LocaleKeys.Gender_Your_Child.tr(),
                    color:const Color(0xFF7DA4FF),
                    fontSize:16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit",
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top:485,
            left: 40,
            child: ContanierRadioWidget(
              child:  Radio(
                value: 1,
                groupValue: radioValueGender,
                onChanged: (value) {
                  setState(() {
                    radioValueGender = value;
                    gender = "Male";
                    BlocProvider.of<AddRegistrationRequestCubit>(context).gender=gender;});},
              ),
            ),

          ),
          BlocProvider.of<LanguageCubit>(context).typeLanguage=='en'?Positioned(
            top: 480, left: 70, right: 260,
            child:Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text:LocaleKeys.Male.tr(),
                    color:const Color(0xFF7DA4FF),
                    fontSize:15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit",
                  ),
                ),
              ],
            ),
          ):Positioned(
            top: 480, left: 70, right: 275,
            child:Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text:LocaleKeys.Male.tr(),
                    color:const Color(0xFF7DA4FF),
                    fontSize:15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit",
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 40, top: 515,
            child: ContanierRadioWidget(
              child: Radio(
                value: 2,
                groupValue: radioValueGender,
                onChanged: (value) {
                  setState(() {
                    radioValueGender = value;
                    gender = "Female";
                    BlocProvider.of<AddRegistrationRequestCubit>(context).gender=gender;});},
              ),
            ),
          ),
          Positioned(
            top: 510, left: 70,
            child: TextWidget(
              text:LocaleKeys.Female.tr(),
              color:const Color(0xFF7DA4FF),
              fontSize:16,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),

          Positioned(
            top: 570, left: 20, right: 20,
            child:Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text: LocaleKeys.Kindergarten_class_Your_Child.tr(),
                    color:const Color(0xFF7DA4FF),
                    fontSize:16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit",
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top:605,
            left: 40,
            child: ContanierRadioWidget(
              child:  Radio(
                value: 1,
                groupValue: radioValueType,
                onChanged: (value) {
                  setState(() {
                    radioValueType = value;
                    kg = "2";
                    BlocProvider.of<AddRegistrationRequestCubit>(context).categoryId=kg;});},
              ),
            ),

          ),
          Positioned(
            top: 600, left: 70,right: 272,
            child:Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text: "Kg1",
                    color:const Color(0xFF7DA4FF),
                    fontSize:15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit",
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 40, top: 630,
            child: ContanierRadioWidget(
              child: Radio(
                value: 2,
                groupValue: radioValueType,
                onChanged: (value) {
                  setState(() {
                    radioValueType = value;
                    kg = "3";
                    BlocProvider.of<AddRegistrationRequestCubit>(context).categoryId=kg;});},
              ),
            ),
          ),
          Positioned(
            top: 625, left: 70,
            child: TextWidget(
              text: "Kg2",
              color:const Color(0xFF7DA4FF),
              fontSize:16,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          Positioned(
            left: 40, top: 655,
            child: ContanierRadioWidget(
              child: Radio(
                value: 3,
                groupValue: radioValueType,
                onChanged: (value) {
                  setState(() {
                    radioValueType = value;
                    kg = "4";
                    BlocProvider.of<AddRegistrationRequestCubit>(context).categoryId=kg;});},
              ),
            ),
          ),
          Positioned(
            top: 650, left: 70,
            child: TextWidget(
              text: "Kg3",
              color:const Color(0xFF7DA4FF),
              fontSize:16,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          Positioned(
            left: 40, top: 680,
            child: ContanierRadioWidget(
              child: Radio(
                value: 4,
                groupValue: radioValueType,
                onChanged: (value) {
                  setState(() {
                    radioValueType = value;
                    kg = "1";
                    BlocProvider.of<AddRegistrationRequestCubit>(context).categoryId=kg;});},
              ),
            ),
          ),
          Positioned(
            top: 675, left: 70,
            child: TextWidget(
              text: "pKg",
              color:const Color(0xFF7DA4FF),
              fontSize:16,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
        ],
      ),
    );
  }
}