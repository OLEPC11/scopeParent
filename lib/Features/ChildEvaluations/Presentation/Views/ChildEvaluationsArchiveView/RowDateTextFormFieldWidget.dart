import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../translations/locale_keys.g.dart';
import '../../../../Attendance/Cubit/ShowAttendanceCubit.dart';
import '../../../Cubit/Month/ShowEvaluationsMonthCubit.dart';
import 'DateTextFormFieldWidget.dart';
import 'DateYearTextFormFieldWidget.dart';


class RowDateTextFormFieldWidget extends StatefulWidget {
  @override
  State<RowDateTextFormFieldWidget > createState()=>_RowDateTextFormFieldWidgetState();
}
class _RowDateTextFormFieldWidgetState extends State<RowDateTextFormFieldWidget>{
  TextEditingController monthController=TextEditingController();
  TextEditingController yearController=TextEditingController();

  final List<String>dropDownItemsMonth=["1","2","3","4","5","6","7","8","9","10","11","12"];
  String selectedTextFiledItemMonth="1";
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Padding(
          padding:const EdgeInsets.only(top:40, left: 30,right: 30),
          child: DateTextFormFieldWidget(
            selectedTextFiledItem: selectedTextFiledItemMonth,
            list: dropDownItemsMonth.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String? value){
              setState(() {
                selectedTextFiledItemMonth=value!;
                BlocProvider.of<ShowEvaluationsMonthCubit>(context).month=value;
              });},
            icon: const Icon(
              Icons.calendar_month,
              color: Color(0xFF7DA4FF),
              size: 20,
            ),
          ),
        ),
        Padding(
          padding:const EdgeInsets.only(top:40, left: 10, right:10,),
          child:DateYearTextFormFieldWidget(
            onChanged: (value){
              BlocProvider.of<ShowEvaluationsMonthCubit>(context).year=value;
            },
            obscureText: false,
            type: TextInputType.number,
            controller: monthController,
            hintText: LocaleKeys.Enter_year.tr(),
            icon: const Icon(
              Icons.calendar_today,
              color: Color(0xFF7DA4FF),
              size: 20,
            ),
            validator: (value) {  },
          ),
        ),
        Padding(
          padding:const EdgeInsets.only(top:40, left: 10, right:10,),
          child:CircleAvatar(
            radius: 25,
            child: IconButton(
              onPressed: (){
                BlocProvider.of<ShowEvaluationsMonthCubit>(context).showShowEvaluationsMonthServices(
                  nameChild:  BlocProvider.of<ShowEvaluationsMonthCubit>(context).nameChild,
                  categoryClass: BlocProvider.of<ShowEvaluationsMonthCubit>(context).categoryClass,
                  accessToken:  BlocProvider.of<ShowEvaluationsMonthCubit>(context).accessToken,
                  month: BlocProvider.of<ShowEvaluationsMonthCubit>(context).month ,
                  year:  BlocProvider.of<ShowEvaluationsMonthCubit>(context).year,
                  type: "Entered month",
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