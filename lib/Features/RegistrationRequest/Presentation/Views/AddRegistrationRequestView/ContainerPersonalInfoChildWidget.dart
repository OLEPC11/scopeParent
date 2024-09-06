import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../Core/Widgets/CustomWidgets/ContainerWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../Cubit/AddRegistrationRequestCubit.dart';
import 'AnswerTextFormFieldWidget.dart';
import 'ContanierRadioWidget.dart';

class  ContainerPersonalInfoChildWidget extends StatefulWidget {

  @override
  State<ContainerPersonalInfoChildWidget> createState()=>_ContainerPersonalInfoChildWidgetState();
}

class _ContainerPersonalInfoChildWidgetState extends State<ContainerPersonalInfoChildWidget>{

  TextEditingController childFavoriteNameController=TextEditingController();
  TextEditingController childFavoriteGameController=TextEditingController();
  TextEditingController childFavoriteColorController=TextEditingController();
  TextEditingController childFavoriteMealController=TextEditingController();
  TextEditingController childBedtimeDuringTheDayController=TextEditingController();
  TextEditingController childBedtimeAtNightController=TextEditingController();

  int? radioValueRelationshipStranger;
  String? relationshipStranger;

  int? radioValueRelationshipChildren;
  String? relationshipChildren;

  @override
  Widget build(BuildContext context) {
    // childFavoriteNameController.text= BlocProvider.of<AddRegistrationRequestCubit>(context).preferredName ?? '';
    // childFavoriteColorController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).favoriteColor ?? '';
    // childFavoriteGameController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).favoriteGame ?? '';
    // childFavoriteMealController.text= BlocProvider.of<AddRegistrationRequestCubit>(context).favoriteMeal ?? '';
    // childBedtimeDuringTheDayController.text = BlocProvider.of<AddRegistrationRequestCubit>(context).dayTimeBedTime ?? '';
    // childBedtimeAtNightController.text= BlocProvider.of<AddRegistrationRequestCubit>(context).nightSleepTime ?? '';
    // radioValueRelationshipStranger = BlocProvider.of<AddRegistrationRequestCubit>(context).relationshipWithStrangers=="Social" ?1:BlocProvider.of<AddRegistrationRequestCubit>(context).relationshipWithStrangers=="Extreme Fear" ?2 :BlocProvider.of<AddRegistrationRequestCubit>(context).relationshipWithStrangers=="Keep Away" ?3:0;
    // radioValueRelationshipChildren = BlocProvider.of<AddRegistrationRequestCubit>(context).relationshipWithChildren=="Play With Them"?1: BlocProvider.of<AddRegistrationRequestCubit>(context).relationshipWithChildren=="Stay Away From Them"?2:BlocProvider.of<AddRegistrationRequestCubit>(context).relationshipWithChildren=="Integrate With Them"?3:0;
    return ContainerWidget(
      padding: const EdgeInsets.only(top:50,left: 20,right: 20),
      height:950,
      width:220,
      widget: Stack(
        children: [
          Positioned(
            top: 10, left: 20,right: 20,
            child:TextWidget(
              text:LocaleKeys.Personal_Info_Of_The_Child.tr(),
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
                    text: LocaleKeys.Child_Favorite_Name.tr(),
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
            top:80, left: 20, right: 20,
            child: AnswerTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).preferredName=value;
              },
              controller:childFavoriteNameController,
            ),
          ),
          Positioned(
            top: 160, left: 20, right: 30,
            child:Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text: LocaleKeys.Child_Favorite_Color.tr(),
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
            top:190, left: 20, right: 20,
            child:  AnswerTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).favoriteColor=value;
              },
              controller:childFavoriteColorController,
            ),
          ),
          Positioned(
            top: 260, left: 20, right: 20,
            child:TextWidget(
              text: LocaleKeys.Child_Favorite_Game.tr(),
              color:const Color(0xFF7DA4FF),
              fontSize:16,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          Positioned(
            top:290, left: 20, right: 20,
            child: AnswerTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).favoriteGame=value;
              },
              controller:childFavoriteGameController,
            ),
          ),
          Positioned(
            top: 360, left: 20, right: 20,
            child:TextWidget(
              text: LocaleKeys.Child_Favorite_Meal.tr(),
              color:const Color(0xFF7DA4FF),
              fontSize:16,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          Positioned(
            top:390, left: 20, right: 20,
            child:  AnswerTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).favoriteMeal=value;
              },
              controller:childFavoriteMealController,
            ),
          ),
          Positioned(
            top: 460, left: 20, right: 20,
            child:TextWidget(
              text: LocaleKeys.Child_Bedtime_During_The_Day.tr(),
              color:const Color(0xFF7DA4FF),
              fontSize:16,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          Positioned(
            top:490, left: 20, right: 20,
            child: AnswerTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).dayTimeBedTime=value;
              },
              controller:childBedtimeDuringTheDayController,
            ),
          ),
          Positioned(
            top: 560, left: 20, right: 20,
            child:TextWidget(
              text: LocaleKeys.Child_Bedtime_At_Night.tr(),
              color:const Color(0xFF7DA4FF),
              fontSize:16,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          Positioned(
            top:590, left: 20, right: 20,
            child: AnswerTextFormFieldWidget(
              onChanged: (value){
                BlocProvider.of<AddRegistrationRequestCubit>(context).nightSleepTime=value;
              },
              controller:childBedtimeAtNightController,
            ),
          ),
          Positioned(
            top: 660, left: 20, right: 20,
            child:Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text: LocaleKeys.The_Child_Relationship_With_The_Stranger.tr(),
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
            top:715, left: 40,
            child: ContanierRadioWidget(
              child:  Radio(
                value: 1,
                groupValue: radioValueRelationshipStranger,
                onChanged: (value) {
                  setState(() {
                    radioValueRelationshipStranger = value;
                    relationshipStranger = "Social";
                    BlocProvider.of<AddRegistrationRequestCubit>(context).relationshipWithStrangers=relationshipStranger;
                  });
                },
              ),
            ),
          ),
          Positioned(
            top: 713, left: 70, right: 230,
            child:Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text: LocaleKeys.Social.tr(),
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
            left: 40, top: 745,
            child: ContanierRadioWidget(
              child: Radio(
                value: 2,
                groupValue: radioValueRelationshipStranger,
                onChanged: (value) {
                  setState(() {
                    radioValueRelationshipStranger = value;
                    relationshipStranger = "Extreme Fear";
                    BlocProvider.of<AddRegistrationRequestCubit>(context).relationshipWithStrangers=relationshipStranger;
                  });},
              ),
            ),
          ),
          Positioned(
            top: 743, left: 70,
            child: TextWidget(
              text:LocaleKeys.Extreme_Fear.tr(),
              color:const Color(0xFF7DA4FF),
              fontSize:16,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          Positioned(
            left: 40, top: 770,
            child: ContanierRadioWidget(
              child: Radio(
                value: 3,
                groupValue: radioValueRelationshipStranger,
                onChanged: (value) {
                  setState(() {
                    radioValueRelationshipStranger = value;
                    relationshipStranger = "Keep Away";
                    BlocProvider.of<AddRegistrationRequestCubit>(context).relationshipWithStrangers=relationshipStranger;
                  });},
              ),
            ),
          ),
          Positioned(
            top: 768, left: 70,
            child: TextWidget(
              text: LocaleKeys.Keep_Away.tr(),
              color:const Color(0xFF7DA4FF),
              fontSize:16,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          Positioned(
            top: 800, left: 20, right: 20,
            child:Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text: LocaleKeys.The_Child_Relationship_With_Other_Children.tr(),
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
            top:850, left: 40,
            child:ContanierRadioWidget(
              child:  Radio(
                value: 1,
                groupValue: radioValueRelationshipChildren,
                onChanged: (value) {
                  setState(() {
                    radioValueRelationshipChildren = value;
                    relationshipChildren= "Play With Them";
                    BlocProvider.of<AddRegistrationRequestCubit>(context).relationshipWithChildren=relationshipChildren;
                  });
                },
              ),
            ),
          ),
          Positioned(
            top: 848, left: 70, right: 180,
            child:Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text: LocaleKeys.Play_With_Them.tr(),
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
            left: 40, top: 880,
            child: ContanierRadioWidget(
              child: Radio(
                value: 2,
                groupValue: radioValueRelationshipChildren,
                onChanged: (value) {
                  setState(() {
                    radioValueRelationshipChildren = value;
                    relationshipChildren = "Stay Away From Them";
                    BlocProvider.of<AddRegistrationRequestCubit>(context).relationshipWithChildren=relationshipChildren;
                  });},
              ),
            ),
          ),

          Positioned(
            top: 878,
            left: 70,
            child: TextWidget(
              text: LocaleKeys.Stay_Away_From_Them.tr(),
              color:const Color(0xFF7DA4FF),
              fontSize:16,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          Positioned(
            left: 40, top: 910,
            child: ContanierRadioWidget(
              child: Radio(
                value: 3,
                groupValue: radioValueRelationshipChildren,
                onChanged: (value) {
                  setState(() {
                    radioValueRelationshipChildren = value;
                    relationshipChildren = "Integrate With Them";
                    BlocProvider.of<AddRegistrationRequestCubit>(context).relationshipWithChildren=relationshipChildren;
                  });},
              ),
            ),
          ),
          Positioned(
            top: 908, left: 70,
            child: TextWidget(
              text: LocaleKeys.Integrate_With_Them.tr(),
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
