import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Core/Widgets/CustomWidgets/CustomButtonWidget.dart';
import 'package:scope_parent/Core/Widgets/TextWidget.dart';
import 'package:scope_parent/Features/ChildDetails/Data/Model/ChildModel.dart';
import '../../../../../main.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../Cubit/ShowAttendanceCubit.dart';
import '../../DisplayAttendanceChildDayView.dart';
import '../../DisplayAttendanceChildMonthView.dart';


class  ChildrenAttendanceItemWidget extends StatelessWidget {
  ChildrenAttendanceItemWidget({required this.childModel});
  ChildModel childModel;
  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color(0xFFAC8FCF),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(bottom: 20,left: 20,right: 20,top: 20),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image:NetworkImage(
                        "http://$ipServer:8000/${childModel.childImagePath}/${childModel.childImageName}",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(Icons.person),
                        const SizedBox(
                          width: 20,
                        ),
                        TextWidget(
                          text: childModel.childName,
                          color:const Color(0xFF7DA4FF),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Outfit",
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(Icons.school),
                        const SizedBox(
                          width: 20,
                        ),
                        TextWidget(
                          text:childModel.childCategory,
                          color:const Color(0xFF7DA4FF),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Outfit",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonWidget(
              text:LocaleKeys.Show_Attendance_Day.tr(),
              onTap: (){
                BlocProvider.of<ShowAttendanceCubit>(context).nameChild=childModel.childName;
                print(childModel.childName);
                BlocProvider.of<ShowAttendanceCubit>(context).showShowAttendanceServices(
                  nameChild: childModel.childName,
                  type:"day",
                  accessToken:  BlocProvider.of<ShowAttendanceCubit>(context).accessToken,
                );
                Navigator.push(context, MaterialPageRoute(
                    builder:(BuildContext context){
                      return DisplayAttendanceChildDayView();
                    }),);
              },
            ),
            SizedBox(height: 10,),
            CustomButtonWidget(
              text:LocaleKeys.Show_Attendance_Month.tr(),
              onTap: (){
                BlocProvider.of<ShowAttendanceCubit>(context).nameChild=childModel.childName;
                print(childModel.childName);
                BlocProvider.of<ShowAttendanceCubit>(context).showShowAttendanceServices(
                  nameChild: childModel.childName,
                  type:"month",
                  accessToken:  BlocProvider.of<ShowAttendanceCubit>(context).accessToken,
                );
                Navigator.push(context, MaterialPageRoute(
                    builder:(BuildContext context){
                      return DisplayAttendanceChildMonthView();
                    }),);
              },
            ),
          ],
        ),
      ),
    );
  }
}
