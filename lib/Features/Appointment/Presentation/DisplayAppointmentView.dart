import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/Appointment/Cubit/ShowAppointmentsStateCubit/ShowAppointmentsStateCubit.dart';
import 'package:scope_parent/Features/Appointment/Presentation/DisplayAppointmentStateView.dart';
import '../../../Core/Widgets/TextWidget.dart';
import '../../../translations/locale_keys.g.dart';
import 'Views/DisplayAppointmentView/DisplayAppointmentViewBody.dart';


class DisplayAppointmentView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFFD4E7FE),
        title: TextWidget(
          text:LocaleKeys.Appointments.tr(),
          color:const Color(0xFF7DA4FF),
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: "Outfit",
        ),
      ),
      backgroundColor: Colors.white,
      body: DisplayAppointmentViewBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          BlocProvider.of<ShowAppointmentsStateCubit>(context).showAppointmentsStateServices(
            accessToken:  BlocProvider.of<ShowAppointmentsStateCubit>(context).accessToken,
          );
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
            return DisplayAppointmentStateView();
          }));
        },
        label:  Text(LocaleKeys.State_Appointment.tr()),
      ),
    );
  }
}
