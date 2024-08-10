import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../Core/Widgets/CustomWidgets/ContainerWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../Cubit/AddRegistrationRequestCubit.dart';
import 'AnswerTextFormFieldWidget.dart';
import 'ContanierRadioWidget.dart';

class  ContainerInfoAboutChild2Widget extends StatefulWidget {
  @override
  State<ContainerInfoAboutChild2Widget> createState()=>_ContainerInfoAboutChild2WidgetState();
}

class _ContainerInfoAboutChild2WidgetState extends State<ContainerInfoAboutChild2Widget>{

  TextEditingController diseasesController=TextEditingController();
  TextEditingController allergyController=TextEditingController();
  TextEditingController medicationController=TextEditingController();

  int? radioValueTemperature;
  String? action;

  @override
  Widget build(BuildContext context) {
    // diseasesController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).chronicDiseases ?? '';
    // allergyController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).typeAllergies ?? '';
    // medicationController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).medicinesForChild ?? '';
    // radioValueTemperature = BlocProvider.of<AddRegistrationRequestCubit>(context).dealingWithHeat=="Contact Parent"? 2:BlocProvider.of<AddRegistrationRequestCubit>(context).dealingWithHeat=="Give The Child A Fever Reducer"?1:0;

    return   ContainerWidget(
      padding: const EdgeInsets.only(top:50,left: 20,right: 20),
      height:550,
      width:220,
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
            top: 50, left: 20, right: 20,
            child:Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text: LocaleKeys.Dose_the_child_suffer_from_chronic_diseases.tr(),
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
            top:110, left: 20, right: 20,
            child: AnswerTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).chronicDiseases=value;
              },
              controller: diseasesController,
            ),
          ),
          Positioned(
            top: 180, left: 20, right: 30,
            child:Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text: LocaleKeys.Dose_the_child_suffer_from_some_type_of_allergy.tr(),
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
            top:240, left: 20, right: 20,
            child:  AnswerTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).typeAllergies=value;
              },
              controller: allergyController,
            ),
          ),
          Positioned(
            top: 310, left: 20, right: 20,
            child:TextWidget(
              text: LocaleKeys.Dose_the_child_need_medication.tr(),
              color:const Color(0xFF7DA4FF),
              fontSize:16,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          Positioned(
            top:340, left: 20, right: 20,
            child:  AnswerTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).medicinesForChild=value;
              },
              controller:medicationController,
            ),
          ),
          Positioned(
            top: 410, left: 20, right: 20,
            child:Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text: LocaleKeys.Your_Preferred_course_of_action_if_the_Child_temperature_suddenly_rises.tr(),
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
            top:475,
            left: 40,
            child: ContanierRadioWidget(
              child:  Radio(
                value: 1,
                groupValue: radioValueTemperature,
                onChanged: (value) {
                  setState(() {
                    radioValueTemperature = value;
                    action = "Give The Child A Fever Reducer";
                    BlocProvider.of<AddRegistrationRequestCubit>(context).dealingWithHeat=action;
                  });},
              ),
            ),

          ),
          Positioned(
            top: 472, left: 70, right: 60,
            child:Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text: LocaleKeys.Give_The_Child_A_Fever_Reducer.tr(),
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
            left: 40, top: 505,
            child: ContanierRadioWidget(
              child: Radio(
                value: 2,
                groupValue: radioValueTemperature,
                onChanged: (value) {
                  setState(() {
                    radioValueTemperature = value;
                    action = "Contact Parent";
                    BlocProvider.of<AddRegistrationRequestCubit>(context).dealingWithHeat=action;
                  });},
              ),
            ),
          ),
          Positioned(
            top: 500, left: 70,
            child: TextWidget(
              text: LocaleKeys.Contact_Parent.tr(),
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
