import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../Attendance/Cubit/ShowAttendanceCubit.dart';
import 'DateDayTextFormFieldWidget.dart';

class RowDateAttendanceDayTextFormFieldWidget extends StatefulWidget {
  @override
  State<RowDateAttendanceDayTextFormFieldWidget > createState()=>_RowDateAttendanceDayTextFormFieldWidgetState();
}
class _RowDateAttendanceDayTextFormFieldWidgetState extends State<RowDateAttendanceDayTextFormFieldWidget>{
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
                  BlocProvider.of<ShowAttendanceCubit>(context).dayEntered=day;
                  BlocProvider.of<ShowAttendanceCubit>(context).monthForDay=month;
                  BlocProvider.of<ShowAttendanceCubit>(context).yearForDay=year;
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
                BlocProvider.of<ShowAttendanceCubit>(context).showShowAttendanceServices(
                  nameChild: BlocProvider.of<ShowAttendanceCubit>(context).nameChild,
                  type:"Entered day",
                  dayEntered:BlocProvider.of<ShowAttendanceCubit>(context).dayEntered ,
                  monthForDay: BlocProvider.of<ShowAttendanceCubit>(context).monthForDay,
                  yearForDay: BlocProvider.of<ShowAttendanceCubit>(context).yearForDay,
                  accessToken:  BlocProvider.of<ShowAttendanceCubit>(context).accessToken,
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