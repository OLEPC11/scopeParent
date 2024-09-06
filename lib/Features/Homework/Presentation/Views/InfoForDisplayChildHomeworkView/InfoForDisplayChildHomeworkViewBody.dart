
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/Attendance/Presentation/DisplayAttendanceChildView.dart';
import 'package:scope_parent/Features/HomeWork/Presentation/HomeworkView.dart';
import 'package:scope_parent/Features/Homework/Cubit/HomeworkCubit.dart';
import '../../../../../Core/Widgets/CustomWidgets/ContainerWidget.dart';
import '../../../../../Core/Widgets/CustomWidgets/CustomButtonWidget.dart';
import '../../../../../Core/Widgets/CustomWidgets/CustomTextFormFieldWidget.dart';
import '../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../RegistrationRequest/Presentation/Views/AddRegistrationRequestView/ContanierRadioWidget.dart';


class  InfoForDisplayChildHomeworkViewBody extends StatefulWidget {
  @override
  State<InfoForDisplayChildHomeworkViewBody> createState()=>_InfoForDisplayChildHomeworkViewBodyState();
}
class _InfoForDisplayChildHomeworkViewBodyState extends State<InfoForDisplayChildHomeworkViewBody>{


  final _formField=GlobalKey<FormState>();

  int? radioValueType;
  int? kg;
  final timeController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formField,
      child: ListView(
        children: [
          ContainerWidget(
            padding: const EdgeInsets.only(top: 120,left: 20,right: 20),
            height:380, width:220,
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
                          BlocProvider.of<HomeworkCubit>(context).day=day;
                          BlocProvider.of<HomeworkCubit>(context).month=month;
                          BlocProvider.of<HomeworkCubit>(context).year=year;
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
                          kg = 1;
                          BlocProvider.of<HomeworkCubit>(context).categoryId=kg;
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
                          kg = 2;
                          BlocProvider.of<HomeworkCubit>(context).categoryId=kg;
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
                          kg = 3;
                          BlocProvider.of<HomeworkCubit>(context).categoryId=kg;
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
                  left: 40, top: 300, right: 40,
                  child: CustomButtonWidget(
                    text: LocaleKeys.Show_Homework.tr(),
                    onTap: ()async{
                      print(BlocProvider.of<HomeworkCubit>(context).day);
                      print(BlocProvider.of<HomeworkCubit>(context).month);
                      print(BlocProvider.of<HomeworkCubit>(context).year);
                      print(BlocProvider.of<HomeworkCubit>(context).categoryId);

                      if(_formField.currentState!.validate()){
                        BlocProvider.of<HomeworkCubit>(context).showHomeworkServices(
                          day: BlocProvider.of<HomeworkCubit>(context).day,
                          month: BlocProvider.of<HomeworkCubit>(context).month,
                          year:BlocProvider.of<HomeworkCubit>(context).year,
                          categoryId: BlocProvider.of<HomeworkCubit>(context).categoryId,
                        );
                        Navigator.push(context, MaterialPageRoute(
                            builder:(BuildContext context){
                              return HomeworkView();
                            }),
                        );
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
