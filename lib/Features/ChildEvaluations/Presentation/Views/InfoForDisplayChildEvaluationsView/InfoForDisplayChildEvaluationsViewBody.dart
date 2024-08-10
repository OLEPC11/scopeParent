import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/ChildEvaluations/Cubit/Month/ShowEvaluationsMonthCubit.dart';
import 'package:scope_parent/Features/ChildEvaluations/Presentation/ChildEvaluationsView.dart';
import '../../../../../Core/Widgets/CustomWidgets/ContainerWidget.dart';
import '../../../../../Core/Widgets/CustomWidgets/CustomButtonWidget.dart';
import '../../../../../Core/Widgets/CustomWidgets/CustomTextFormFieldWidget.dart';
import '../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../RegistrationRequest/Presentation/Views/AddRegistrationRequestView/ContanierRadioWidget.dart';
import '../../../Cubit/Day/ShowEvaluationsDayCubit.dart';
import '../../ChildEvaluationsDayView.dart';


class  InfoForDisplayChildEvaluationsViewBody extends StatefulWidget {
  @override
  State<InfoForDisplayChildEvaluationsViewBody> createState()=>_InfoForDisplayChildEvaluationsViewBodyState();
}
class _InfoForDisplayChildEvaluationsViewBodyState extends State<InfoForDisplayChildEvaluationsViewBody>{


  final _formField=GlobalKey<FormState>();
  final childFullNameController=TextEditingController();
  int? radioValueType;
  String? kg;

  int? radioValueTime;
  String? time;


  final timeController=TextEditingController();

  final monthController=TextEditingController();
  final yearController=TextEditingController();

  Future openDialog()=> showDialog(
    context: context,
    builder: (context)=>AlertDialog(
      title: TextWidget(
        text: LocaleKeys.Add_Your_Time.tr(),
        color: const Color(0xFF7DA4FF),
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Outfit",
      ),
      content: CustomTextFormFieldWidget(
        obscureText: false,
        controller: timeController,
        hintText:LocaleKeys.Enter_Your_Day.tr(),
        icon: const Icon(
          Icons.calendar_today_outlined,
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
              timeController.text=DateFormat("yyyy-MM-dd",'en_US').format(pickedDate);
              String formattedDate = DateFormat("yyyy-MM-dd",'en_US').format(pickedDate);
              DateTime parsedDate = DateFormat("yyyy-MM-dd",'en_US').parse(formattedDate);
              int day = parsedDate.day;
              int month = parsedDate.month;
              int year = parsedDate.year;
              BlocProvider.of<ShowEvaluationsDayCubit>(context).day=day;
              BlocProvider.of<ShowEvaluationsDayCubit>(context).month=month;
              BlocProvider.of<ShowEvaluationsDayCubit>(context).year=year;
              print(pickedDate);
              print(parsedDate);
              print('Day: $day, Month: $month, Year: $year');
              print(timeController.text = formattedDate);
            });
          }
        },
        validator: (value){
          if(value!.isEmpty){
            return(LocaleKeys.Enter_Your_Day.tr());
          }},
      ),
      actions: [
        CustomButtonWidget(
          onTap: ()async{
            Navigator.pop(context);
          },
          text: LocaleKeys.Next.tr(),
        ),
      ],
    ),
  );



  Future openDialogMonth()=> showDialog(
    context: context,
    builder: (context)=>AlertDialog(
      title: TextWidget(
        text: LocaleKeys.Add_Your_Time.tr(),
        color: const Color(0xFF7DA4FF),
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Outfit",
      ),
      content:Container(
        height: 180,
        width: 220,
        child:  Stack(
          children: [
            Positioned(
              top: 20,
              right: 10,
              left: 10,
              child:  CustomTextFormFieldWidget(
                onChanged: (value){
                  BlocProvider.of<ShowEvaluationsMonthCubit>(context).month=value;
                  BlocProvider.of<ShowEvaluationsMonthCubit>(context).month=monthController.text;
                },
                obscureText: false,
                type: TextInputType.number,
                controller: monthController,
                hintText:LocaleKeys.Enter_Number_Month.tr(),
                icon: const Icon(
                  Icons.calendar_month,
                  color: Color(0xFF7DA4FF),
                  size: 20,
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return(LocaleKeys.Enter_Number_Month.tr());
                  }},
              ),
            ),
            Positioned(
              top: 100,
              right: 10,
              left: 10,
              child: CustomTextFormFieldWidget(
                onChanged: (value){
                  BlocProvider.of<ShowEvaluationsMonthCubit>(context).year=value;
                  BlocProvider.of<ShowEvaluationsMonthCubit>(context).year=yearController.text;
                },
                obscureText: false,
                controller: yearController,
                type: TextInputType.number,
                hintText:LocaleKeys.Enter_Number_Year.tr(),
                icon: const Icon(
                  Icons.calendar_today,
                  color: Color(0xFF7DA4FF),
                  size: 20,
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return(LocaleKeys.Enter_Number_Year.tr());
                  }},
              ),
            ),
          ],
        ),
      ),
      actions: [
        CustomButtonWidget(
          onTap: ()async{
            Navigator.pop(context);
          },
          text:LocaleKeys.Next.tr(),
        ),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formField,
      child: ListView(
        children: [
          ContainerWidget(
            padding: const EdgeInsets.only(top: 120,left: 20,right: 20),
            height:580, width:220,
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
                    onChanged: (value){
                      BlocProvider.of<ShowEvaluationsDayCubit>(context).nameChild=value;
                      BlocProvider.of<ShowEvaluationsDayCubit>(context).nameChild=childFullNameController.text;

                      BlocProvider.of<ShowEvaluationsMonthCubit>(context).nameChild=value;
                      BlocProvider.of<ShowEvaluationsMonthCubit>(context).nameChild=childFullNameController.text;
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
                  top: 150, left: 30, right: 20,
                  child:Row(
                    children: [
                      Expanded(
                        child: TextWidget(
                          text: LocaleKeys.Kindergarten_class_Your_Child1.tr(),
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
                  top:180,
                  left: 40,
                  child: ContanierRadioWidget(
                    child:  Radio(
                      value: 1,
                      groupValue: radioValueType,
                      onChanged: (value) {
                        setState(() {
                          radioValueType = value;
                          kg = "Kg1";
                          BlocProvider.of<ShowEvaluationsDayCubit>(context).categoryClass=kg;
                          BlocProvider.of<ShowEvaluationsMonthCubit>(context).categoryClass=kg;
                        });},
                    ),
                  ),

                ),
                Positioned(
                  top: 180, left: 70,right: 272,
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
                  left: 40, top: 210,
                  child: ContanierRadioWidget(
                    child: Radio(
                      value: 2,
                      groupValue: radioValueType,
                      onChanged: (value) {
                        setState(() {
                          radioValueType = value;
                          kg = "Kg2";
                          BlocProvider.of<ShowEvaluationsDayCubit>(context).categoryClass=kg;
                          BlocProvider.of<ShowEvaluationsMonthCubit>(context).categoryClass=kg;
                        });},
                    ),
                  ),
                ),
                Positioned(
                  top: 210, left: 70,
                  child: TextWidget(
                    text: "Kg2",
                    color:const Color(0xFF7DA4FF),
                    fontSize:16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit",
                  ),
                ),
                Positioned(
                  left: 40, top: 240,
                  child: ContanierRadioWidget(
                    child: Radio(
                      value: 3,
                      groupValue: radioValueType,
                      onChanged: (value) {
                        setState(() {
                          radioValueType = value;
                          kg = "Kg3";
                          BlocProvider.of<ShowEvaluationsDayCubit>(context).categoryClass=kg;
                          BlocProvider.of<ShowEvaluationsMonthCubit>(context).categoryClass=kg;
                        });},
                    ),
                  ),
                ),
                Positioned(
                  top: 240, left: 70,
                  child: TextWidget(
                    text: "Kg3",
                    color:const Color(0xFF7DA4FF),
                    fontSize:16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit",
                  ),
                ),
                Positioned(
                  top: 280, left: 20, right: 20,
                  child:Row(
                    children: [
                      Expanded(
                        child: TextWidget(
                          text: LocaleKeys.You_Want_The_Evaluation_For_Day_Or_Month.tr(),
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
                  top:340,
                  left: 40,
                  child: ContanierRadioWidget(
                    child:  Radio(
                      value: 1,
                      groupValue: radioValueTime,
                      onChanged: (value) {
                        setState(() {
                          radioValueTime = value;
                          time="day";
                          BlocProvider.of<ShowEvaluationsDayCubit>(context).type="day";
                          openDialog();
                        });},
                    ),
                  ),

                ),
                Positioned(
                  top: 338, left: 70, right: 260,
                  child:Row(
                    children: [
                      Expanded(
                        child: TextWidget(
                          text: LocaleKeys.Day.tr(),
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
                  left: 40, top: 380,
                  child: ContanierRadioWidget(
                    child: Radio(
                      value: 2,
                      groupValue: radioValueTime,
                      onChanged: (value) {
                        setState(() {
                          radioValueTime = value;
                          time="month";
                          BlocProvider.of<ShowEvaluationsMonthCubit>(context).type="month";
                          openDialogMonth();
                        }
                        );},
                    ),
                  ),
                ),
                Positioned(
                  top: 378, left: 70,
                  child: TextWidget(
                    text: LocaleKeys.Month.tr(),
                    color:const Color(0xFF7DA4FF),
                    fontSize:16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit",
                  ),
                ),
                Positioned(
                  left: 40, top: 430, right: 40,
                  child: CustomButtonWidget(
                    text: LocaleKeys.Show_Evaluation.tr(),
                    onTap: ()async{
                      print(BlocProvider.of<ShowEvaluationsDayCubit>(context).nameChild);
                      print(BlocProvider.of<ShowEvaluationsDayCubit>(context).type);
                      print(BlocProvider.of<ShowEvaluationsDayCubit>(context).day);
                      print(BlocProvider.of<ShowEvaluationsDayCubit>(context).month);
                      print(BlocProvider.of<ShowEvaluationsDayCubit>(context).year);
                      print(BlocProvider.of<ShowEvaluationsDayCubit>(context).categoryClass);
                      print(BlocProvider.of<ShowEvaluationsDayCubit>(context).accessToken);

                      print(BlocProvider.of<ShowEvaluationsMonthCubit>(context).nameChild);
                      print(BlocProvider.of<ShowEvaluationsMonthCubit>(context).type);
                      print(BlocProvider.of<ShowEvaluationsMonthCubit>(context).month);
                      print(BlocProvider.of<ShowEvaluationsMonthCubit>(context).year);
                      print(BlocProvider.of<ShowEvaluationsMonthCubit>(context).categoryClass);
                      print(BlocProvider.of<ShowEvaluationsMonthCubit>(context).accessToken);
                      if(_formField.currentState!.validate()){
                        if( time=="day"){
                          BlocProvider.of<ShowEvaluationsDayCubit>(context).showShowEvaluationsServices(
                            nameChild:  BlocProvider.of<ShowEvaluationsDayCubit>(context).nameChild,
                            day:  BlocProvider.of<ShowEvaluationsDayCubit>(context).day,
                            month:  BlocProvider.of<ShowEvaluationsDayCubit>(context).month,
                            year:  BlocProvider.of<ShowEvaluationsDayCubit>(context).year,
                            categoryClass: BlocProvider.of<ShowEvaluationsDayCubit>(context).categoryClass,
                            accessToken:  BlocProvider.of<ShowEvaluationsDayCubit>(context).accessToken,
                          );
                          Navigator.push(context, MaterialPageRoute(
                              builder:(BuildContext context){
                                return ChildEvaluationsDayView();
                              }),);
                        }
                        else {
                          BlocProvider.of<ShowEvaluationsMonthCubit>(context).showShowEvaluationsMonthServices(
                            nameChild:  BlocProvider.of<ShowEvaluationsMonthCubit>(context).nameChild,
                            month:  BlocProvider.of<ShowEvaluationsMonthCubit>(context).month,
                            year:  BlocProvider.of<ShowEvaluationsMonthCubit>(context).year,
                            categoryClass: BlocProvider.of<ShowEvaluationsMonthCubit>(context).categoryClass,
                            accessToken:  BlocProvider.of<ShowEvaluationsMonthCubit>(context).accessToken,
                          );
                          Navigator.push(context, MaterialPageRoute(
                              builder:(BuildContext context){
                                return ChildEvaluationsView();
                              }),);
                        }

                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
