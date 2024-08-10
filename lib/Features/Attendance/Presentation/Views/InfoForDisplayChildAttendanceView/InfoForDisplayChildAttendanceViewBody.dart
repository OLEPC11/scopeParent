
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/Attendance/Cubit/ShowAttendanceCubit.dart';
import 'package:scope_parent/Features/Attendance/Presentation/DisplayAttendanceChildView.dart';
import 'package:scope_parent/Features/ChildDetails/Presentation/DisplayChildDetailsView.dart';
import 'package:scope_parent/Features/ChildEvaluations/Presentation/ChildEvaluationsView.dart';
import 'package:scope_parent/Features/Invoices/Presentation/DisplayChildInvoicesView.dart';

import '../../../../../Core/Widgets/CustomWidgets/ContainerWidget.dart';
import '../../../../../Core/Widgets/CustomWidgets/CustomButtonWidget.dart';
import '../../../../../Core/Widgets/CustomWidgets/CustomTextFormFieldWidget.dart';
import '../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../RegistrationRequest/Presentation/Views/AddRegistrationRequestView/ContanierRadioWidget.dart';


class  InfoForDisplayChildAttendanceViewBody extends StatefulWidget {
  @override
  State<InfoForDisplayChildAttendanceViewBody> createState()=>_InfoForDisplayChildAttendanceViewBodyState();
}
class _InfoForDisplayChildAttendanceViewBodyState extends State<InfoForDisplayChildAttendanceViewBody>{


  final _formField=GlobalKey<FormState>();
  final childFullNameController=TextEditingController();

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
              BlocProvider.of<ShowAttendanceCubit>(context).dateDay=timeController.text;
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
            BlocProvider.of<ShowAttendanceCubit>(context).dateMonth="${yearController.text}-${monthController.text}";
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
            height:400, width:220,
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
                      BlocProvider.of<ShowAttendanceCubit>(context).nameChild=value;
                      BlocProvider.of<ShowAttendanceCubit>(context).nameChild=childFullNameController.text;
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
                  top: 160, left: 20, right: 20,
                  child:Row(
                    children: [
                      Expanded(
                        child: TextWidget(
                          text: LocaleKeys.You_Want_The_Attendance_For_Day_Or_Month.tr(),
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
                  top:240,
                  left: 40,
                  child: ContanierRadioWidget(
                    child:  Radio(
                      value: 1,
                      groupValue: radioValueTime,
                      onChanged: (value) {
                        setState(() {
                          radioValueTime = value;
                          time="day";
                          BlocProvider.of<ShowAttendanceCubit>(context).type=time;
                          openDialog();
                        });},
                    ),
                  ),

                ),
                Positioned(
                  top: 238, left: 70, right: 260,
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
                  left: 40, top: 280,
                  child: ContanierRadioWidget(
                    child: Radio(
                      value: 2,
                      groupValue: radioValueTime,
                      onChanged: (value) {
                        setState(() {
                          radioValueTime = value;
                          time="month";
                          BlocProvider.of<ShowAttendanceCubit>(context).type=time;
                          openDialogMonth();
                        }
                        );},
                    ),
                  ),
                ),
                Positioned(
                  top: 278, left: 70,
                  child: TextWidget(
                    text: LocaleKeys.Month.tr(),
                    color:const Color(0xFF7DA4FF),
                    fontSize:16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit",
                  ),
                ),
                Positioned(
                  left: 40, top: 330, right: 40,
                  child: CustomButtonWidget(
                    text: LocaleKeys.Show_Attendance.tr(),
                    onTap: ()async{
                      print(BlocProvider.of<ShowAttendanceCubit>(context).nameChild);
                      print(BlocProvider.of<ShowAttendanceCubit>(context).type);
                      print(BlocProvider.of<ShowAttendanceCubit>(context).dateDay);
                      print(BlocProvider.of<ShowAttendanceCubit>(context).dateMonth);
                      print(BlocProvider.of<ShowAttendanceCubit>(context).accessToken);
                      if(_formField.currentState!.validate()){
                        BlocProvider.of<ShowAttendanceCubit>(context).showShowAttendanceServices(
                          nameChild:  BlocProvider.of<ShowAttendanceCubit>(context).nameChild,
                          dateDay:  BlocProvider.of<ShowAttendanceCubit>(context).dateDay,
                          dateMonth:  BlocProvider.of<ShowAttendanceCubit>(context).dateMonth,
                          type:  BlocProvider.of<ShowAttendanceCubit>(context).type,
                          accessToken:  BlocProvider.of<ShowAttendanceCubit>(context).accessToken,
                        );
                        Navigator.push(context, MaterialPageRoute(
                            builder:(BuildContext context){
                              return DisplayAttendanceChildView();
                            }),);
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
