import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Core/Widgets/TextWidget.dart';
import 'package:scope_parent/Features/Appointment/Presentation/Views/DisplayAppointmentStateView/AppointmentStateItemWidget.dart';
import '../../../Cubit/ShowAppointmentsStateCubit/ShowAppointmentsStateCubit.dart';

class DisplayAppointmentStateViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ShowAppointmentsStateCubit,ShowAppointmentsStateState>(
      builder:(context,state){
        if(state is ShowAppointmentsStateLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(state is ShowAppointmentsStateSuccess){
          return  SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.appointmentsStateModel.length,
                      itemBuilder: (context,index){
                        return AppointmentStateItemwidget(
                          appointmentsStateModel:state.appointmentsStateModel[index] ,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        else if(state is ShowAppointmentsStateFailure){
          return Center(
            child:TextWidget(
              text:"There Is No Appointment Available",
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          );
        }
        else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
