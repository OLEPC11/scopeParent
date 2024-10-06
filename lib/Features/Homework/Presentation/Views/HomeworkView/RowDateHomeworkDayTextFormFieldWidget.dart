import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../Attendance/Presentation/Views/DisplayChildAttendanceDayView/DateDayTextFormFieldWidget.dart';
import '../../../Cubit/HomeworkCubit/HomeworkCubit.dart';

class RowDateHomeworkDayTextFormFieldWidget extends StatefulWidget {
  @override
  State<RowDateHomeworkDayTextFormFieldWidget > createState()=>_RowDateHomeworkDayTextFormFieldWidgetState();
}
class _RowDateHomeworkDayTextFormFieldWidgetState extends State<RowDateHomeworkDayTextFormFieldWidget>{
  TextEditingController dayController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Padding(
          padding:const EdgeInsets.only(top:40, left: 40,right: 40),
          child:DateDayTextFormFieldWidget(
            obscureText: false,
            controller: dayController,
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
                  dayController.text=DateFormat("yyyy-MM-dd",'en_US').format(pickedDate);
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
                  print(dayController.text = formattedDate);
                });
              }
            },
            validator: (value){
              if(value!.isEmpty){
                return(LocaleKeys.Enter_Your_Day.tr());
              }},
          ),
        ),
        Padding(
          padding:const EdgeInsets.only(top:40, left: 10, right:10,),
          child:CircleAvatar(
            radius: 25,
            child: IconButton(
              onPressed: (){
                BlocProvider.of<HomeworkCubit>(context).showHomeworkServices(
                  categoryId:BlocProvider.of<HomeworkCubit>(context).categoryId ,
                  type:"Entered day",
                  day:BlocProvider.of<HomeworkCubit>(context).day ,
                  month: BlocProvider.of<HomeworkCubit>(context).month,
                  year: BlocProvider.of<HomeworkCubit>(context).year,
                );
              },
              icon: const Icon(Icons.arrow_forward,size: 20, color: Color(0xFF7DA4FF),),
            ),
          ),
        ),
      ],
    );
  }
}