import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scope_parent/Features/Appointment/Cubit/AddReservationCubit/AddReservationCubit.dart';
import 'package:scope_parent/Features/Appointment/Cubit/ShowAppointmentsStateCubit/ShowAppointmentsStateCubit.dart';
import 'package:scope_parent/Features/Attendance/Cubit/ShowAttendanceCubit.dart';
import 'package:scope_parent/Features/ChildDetails/Cubit/ShowAllChildCubit/ShowAllChildCubit.dart';
import 'package:scope_parent/Features/ChildEvaluations/Cubit/Month/ShowEvaluationsMonthCubit.dart';
import 'package:scope_parent/Features/Home/Cubit/RegistrationRequestStateCubit/ShowRegistrationRequestStateCubit.dart';
import 'package:scope_parent/Features/Invoices/Cubit/ShowInvoicesCubit.dart';
import 'package:scope_parent/Features/Login/Cubit/LoginCubit.dart';
import 'package:scope_parent/Features/Login/Presentation/Views/LoginView/EmailFieldWidget.dart';
import 'package:scope_parent/Features/Login/Presentation/Views/LoginView/LoginTextWidget.dart';
import 'package:scope_parent/Features/Login/Presentation/Views/LoginView/PasswordFieldWidget.dart';
import 'package:scope_parent/Features/RegistrationRequest/Cubit/AddRegistrationRequestCubit.dart';
import '../../../../../Core/Widgets/CustomWidgets/ContainerWidget.dart';
import '../../../../ChildEvaluations/Cubit/Day/ShowEvaluationsDayCubit.dart';
import '../../../../Home/Cubit/EditProfileCubit/EditProfileCubit.dart';
import '../../../../Home/Cubit/ShowProfileCubit/ShowProfileCubit.dart';
import '../../../../Home/Presentation/HomeView.dart';
import 'LoginButtonWidget.dart';
import 'LogoImageWidget.dart';
import 'RegisterTextButtonWidget.dart';

class LoginViewBody extends StatelessWidget {

  final _formField=GlobalKey<FormState>();
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<LoginCubit,LoginState>(
      listener: (context,state){
        if(state is LoginLoading){
          isLoading=true;
        }
        else if(state is LoginSuccess){
          print(BlocProvider.of<LoginCubit>(context).loginUserModel!.accessToken);
          print(BlocProvider.of<LoginCubit>(context).loginUserModel!.image);
          print(BlocProvider.of<LoginCubit>(context).loginUserModel!.firstName);
          print(BlocProvider.of<LoginCubit>(context).loginUserModel!.lastName);
          print(BlocProvider.of<LoginCubit>(context).loginUserModel!.phoneNumber);
          print(BlocProvider.of<LoginCubit>(context).loginUserModel!.email);
          print(BlocProvider.of<LoginCubit>(context).loginUserModel!.userId);
          print(BlocProvider.of<LoginCubit>(context).loginUserModel!.roleId);
          Navigator.push(context, MaterialPageRoute(
              builder:(BuildContext context){
                return HomeView();
              }),);
          BlocProvider.of<ShowProfileCubit>(context).showProfileServices(
            accessToken:  BlocProvider.of<LoginCubit>(context).loginUserModel!.accessToken,
          );
          BlocProvider.of<EditProfileCubit>(context).accessToken=BlocProvider.of<LoginCubit>(context).loginUserModel!.accessToken;
          BlocProvider.of<ShowProfileCubit>(context).accessToken=BlocProvider.of<LoginCubit>(context).loginUserModel!.accessToken;
          BlocProvider.of<AddReservationCubit>(context).accessToken=BlocProvider.of<LoginCubit>(context).loginUserModel!.accessToken;
          BlocProvider.of<AddRegistrationRequestCubit>(context).accessToken=BlocProvider.of<LoginCubit>(context).loginUserModel!.accessToken;
          BlocProvider.of<ShowInvoicesCubit>(context).accessToken=BlocProvider.of<LoginCubit>(context).loginUserModel!.accessToken;
          BlocProvider.of<ShowAllChildCubit>(context).accessToken=BlocProvider.of<LoginCubit>(context).loginUserModel!.accessToken;
          BlocProvider.of<ShowAttendanceCubit>(context).accessToken=BlocProvider.of<LoginCubit>(context).loginUserModel!.accessToken;
          BlocProvider.of<ShowEvaluationsDayCubit>(context).accessToken=BlocProvider.of<LoginCubit>(context).loginUserModel!.accessToken;
          BlocProvider.of<ShowEvaluationsMonthCubit>(context).accessToken=BlocProvider.of<LoginCubit>(context).loginUserModel!.accessToken;
          BlocProvider.of<ShowAppointmentsStateCubit>(context).accessToken=BlocProvider.of<LoginCubit>(context).loginUserModel!.accessToken;
          BlocProvider.of<ShowRegistrationRequestStateCubit>(context).accessToken=BlocProvider.of<LoginCubit>(context).loginUserModel!.accessToken;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Login Successfully"),
            ),
          );
          isLoading=false;
        }
        else if(state is LoginFailure){
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
                LogoImageWidget(),
                ContainerWidget(
                  padding: const EdgeInsets.only(top:20,left: 20,right: 20),
                  height:350,
                  width:220,
                  widget: Stack(
                    children: [
                      Positioned(
                        top: 20, left: 60, right: 40,
                        child:LoginTextWidget(),
                      ),
                      Positioned(
                        top: 80, left: 20, right: 20,
                        child:EmailFieldWidget(),
                      ),
                      Positioned(
                        top: 160, left: 20, right: 20,
                        child: PasswordFieldWidget(),
                      ),
                      Positioned(
                        top: 240, left: 40, right: 40,
                        child: LoginButtonWidget(
                          formField:_formField,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 30,right: 20),
                  child:  RegisterTextButtonWidget(),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

