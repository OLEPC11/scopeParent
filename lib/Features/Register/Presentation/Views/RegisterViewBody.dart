import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scope_parent/Features/Appointment/Cubit/ShowAppointmentsStateCubit/ShowAppointmentsStateCubit.dart';
import 'package:scope_parent/Features/Attendance/Cubit/ShowAttendanceCubit.dart';
import 'package:scope_parent/Features/ChildDetails/Cubit/ShowAllChildCubit/ShowAllChildCubit.dart';
import 'package:scope_parent/Features/ChildEvaluations/Cubit/Month/ShowEvaluationsMonthCubit.dart';
import 'package:scope_parent/Features/Home/Cubit/RegistrationRequestStateCubit/ShowRegistrationRequestStateCubit.dart';
import 'package:scope_parent/Features/Invoices/Cubit/ShowInvoicesCubit.dart';
import 'package:scope_parent/Features/Register/Cubit/RegisterCubit.dart';
import 'package:scope_parent/Features/Register/Presentation/Views/RegisterAddImageWidget.dart';
import 'package:scope_parent/Features/RegistrationRequest/Cubit/AddRegistrationRequestCubit.dart';
import '../../../../../../Core/Widgets/CustomWidgets/ContainerWidget.dart';
import '../../../Appointment/Cubit/AddReservationCubit/AddReservationCubit.dart';
import '../../../ChildEvaluations/Cubit/Day/ShowEvaluationsDayCubit.dart';
import '../../../Home/Cubit/EditProfileCubit/EditProfileCubit.dart';
import '../../../Home/Cubit/ShowProfileCubit/ShowProfileCubit.dart';
import '../../../Home/Presentation/HomeView.dart';
import 'RegisterFieldsWidget.dart';

class  RegisterViewBody extends StatelessWidget {

  final _formField=GlobalKey<FormState>();
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterState>(
      listener: (context,state){
        if(state is RegisterLoading){
          isLoading=true;
        }
        else if(state is RegisterSuccess){
          print(BlocProvider.of<RegisterCubit>(context).registerUserModel!.accessToken);
          print(BlocProvider.of<RegisterCubit>(context).registerUserModel!.image);
          print(BlocProvider.of<RegisterCubit>(context).registerUserModel!.firstName);
          print(BlocProvider.of<RegisterCubit>(context).registerUserModel!.lastName);
          print(BlocProvider.of<RegisterCubit>(context).registerUserModel!.phoneNumber);
          print(BlocProvider.of<RegisterCubit>(context).registerUserModel!.email);
          print(BlocProvider.of<RegisterCubit>(context).registerUserModel!.userId);
          print(BlocProvider.of<RegisterCubit>(context).registerUserModel!.roleId);
          Navigator.push(context, MaterialPageRoute(
              builder:(BuildContext context){
                return HomeView();
              }),);
          BlocProvider.of<ShowProfileCubit>(context).showProfileServices(
            accessToken:  BlocProvider.of<RegisterCubit>(context).registerUserModel!.accessToken,
          );
          BlocProvider.of<EditProfileCubit>(context).accessToken=BlocProvider.of<RegisterCubit>(context).registerUserModel!.accessToken;
          BlocProvider.of<ShowProfileCubit>(context).accessToken=BlocProvider.of<RegisterCubit>(context).registerUserModel!.accessToken;
          BlocProvider.of<AddReservationCubit>(context).accessToken=BlocProvider.of<RegisterCubit>(context).registerUserModel!.accessToken;
          BlocProvider.of<AddRegistrationRequestCubit>(context).accessToken=BlocProvider.of<RegisterCubit>(context).registerUserModel!.accessToken;
          BlocProvider.of<ShowInvoicesCubit>(context).accessToken=BlocProvider.of<RegisterCubit>(context).registerUserModel!.accessToken;
          BlocProvider.of<ShowAllChildCubit>(context).accessToken=BlocProvider.of<RegisterCubit>(context).registerUserModel!.accessToken;
          BlocProvider.of<ShowAttendanceCubit>(context).accessToken=BlocProvider.of<RegisterCubit>(context).registerUserModel!.accessToken;
          BlocProvider.of<ShowEvaluationsDayCubit>(context).accessToken=BlocProvider.of<RegisterCubit>(context).registerUserModel!.accessToken;
          BlocProvider.of<ShowEvaluationsMonthCubit>(context).accessToken=BlocProvider.of<RegisterCubit>(context).registerUserModel!.accessToken;
          BlocProvider.of<ShowAppointmentsStateCubit>(context).accessToken=BlocProvider.of<RegisterCubit>(context).registerUserModel!.accessToken;
          BlocProvider.of<ShowRegistrationRequestStateCubit>(context).accessToken=BlocProvider.of<RegisterCubit>(context).registerUserModel!.accessToken;
          isLoading=false;
        }
        else if(state is RegisterFailure){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
          isLoading=false;
        }
      },
      builder: (context,state){
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child:Form(
            key: _formField,
            child: ListView(
              children: [
                RegisterAddImageWidget(),
                ContainerWidget(
                  padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
                  height:520,
                  width:220,
                  widget:RegisterFieldsWidget(formField: _formField),
                ),
                const SizedBox(height: 40,),
              ],
            ),
          ),
        );
        },
    );
  }
}
