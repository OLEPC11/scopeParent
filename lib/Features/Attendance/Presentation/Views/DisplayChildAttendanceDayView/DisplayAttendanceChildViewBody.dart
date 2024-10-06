import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/Attendance/Cubit/ShowAttendanceCubit.dart';
import '../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../main.dart';
import 'AttendanceChildItemWidget.dart';
import 'RowDateAttendanceDayTextFormFieldWidget.dart';

class  DisplayAttendanceChildDayViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RowDateAttendanceDayTextFormFieldWidget(),
        BlocBuilder<ShowAttendanceCubit,ShowAttendanceState>(
          builder: (context,state){
            if(state is ShowAttendanceLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(state is ShowAttendanceSuccess ){
              print(state.attendanceModel);
              return  SizedBox(
                child:  ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount:state.attendanceModel.dates.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context,index) {
                    return AttendanceChildItemWidget(
                      image: "http://$ipServer:8000/${state.attendanceModel.childImagePath}/${state.attendanceModel.childImageName}",
                      name: state.attendanceModel.childName,
                      kg: state.attendanceModel.childCategory,
                      date: state.attendanceModel.dates[index],
                      status:state.attendanceModel.statuses[index],
                    );
                  },
                ),
              );
            }
            else if(state is ShowAttendanceFailure){
              print(state.errorMessage);
              return Center(
                child:TextWidget(
                  text:"There Is No Attendance Available",
                  color:const Color(0xFF7DA4FF),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit",
                ),
              );
            }
            else{
              return Center(
                child:TextWidget(
                  text:"There Is No Attendance Available",
                  color:const Color(0xFF7DA4FF),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit",
                ),
              );
            }},
        )
      ],
    );
  }
}
