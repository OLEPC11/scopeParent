import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scope_parent/Core/Widgets/CustomWidgets/CustomButtonWidget.dart';
import 'package:scope_parent/Core/Widgets/TextWidget.dart';
import 'package:scope_parent/Features/Appointment/Cubit/AddReservationCubit/AddReservationCubit.dart';
import 'package:scope_parent/Features/Appointment/Cubit/ShowAppointmentCubit/ShowAppointmentCubit.dart';
import 'package:scope_parent/Features/Appointment/Presentation/Views/DisplayAppointmentView/AppointmentItemWidget.dart';
import '../../../../../Core/Widgets/CustomWidgets/CustomTextFormFieldWidget.dart';
import '../../../../../translations/locale_keys.g.dart';

class DisplayAppointmentViewBody extends StatefulWidget {

  @override
  State<DisplayAppointmentViewBody> createState()=>_DisplayAppointmentViewBodyState();
}
class _DisplayAppointmentViewBodyState extends State<DisplayAppointmentViewBody>{

  final reasonController=TextEditingController();
  bool isLoading=false;
  Future openDialog(dynamic index)=> showDialog(
    context: context,
    builder: (context)=>BlocConsumer<AddReservationCubit,AddReservationState>(
      listener: (context,state){
        if(state is AddReservationLoading){
          isLoading=true;
        }
        else if(state is AddReservationSuccess){
          print("Done");
          Navigator.pop(context);
          isLoading=false;
        }
        else if(state is AddReservationFailure){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
          isLoading=false;
        }
      },
      builder:(context,state){
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child:   AlertDialog(
            title: TextWidget(
              text: LocaleKeys.Add_Your_Reason.tr(),
              color: const Color(0xFF7DA4FF),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
            content: CustomTextFormFieldWidget(
              obscureText: false,
              controller: reasonController,
              hintText:LocaleKeys.Enter_The_Reason.tr(),
              icon: const Icon(
                Icons.question_answer,
                color: Color(0xFF7DA4FF),
                size: 20,
              ),
              validator: (value){
                if(value!.isEmpty){
                  return(LocaleKeys.Enter_The_Reason.tr());
                }},
            ),
            actions: [
              CustomButtonWidget(
                onTap: ()async{
                  print(index);
                  BlocProvider.of<AddReservationCubit>(context).addReservationServices(
                    appointmentId: index.toString(),
                    description: reasonController.text,
                    accessToken: BlocProvider.of<AddReservationCubit>(context).accessToken,
                  );
                },
                text: LocaleKeys.Next.tr(),
              ),
            ],
          ),
        );
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
        child: BlocBuilder<ShowAppointmentCubit,ShowAppointmentState>(
          builder:(context,state){
            if(state is ShowAppointmentLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(state is ShowAppointmentSuccess){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount:state.appointmentsModel.length,
                      itemBuilder: (context,index){
                        return AppointmentItemWidget(
                          date:state.appointmentsModel[index].day,
                          time: state.appointmentsModel[index].time,
                          onTap: (){
                            openDialog(state.appointmentsModel[index].appointmentsId);
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            else if(state is ShowAppointmentFailure){
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
        ),
      ),
    );
  }
}
