import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/Activities/Cubit/ShowActivitiesCubit.dart';
import 'package:scope_parent/Features/Appointment/Cubit/AddReservationCubit/AddReservationCubit.dart';
import 'package:scope_parent/Features/Appointment/Cubit/ShowAppointmentCubit/ShowAppointmentCubit.dart';
import 'package:scope_parent/Features/Attendance/Cubit/ShowAttendanceCubit.dart';
import 'package:scope_parent/Features/ChildDetails/Cubit/ShowAllChildCubit/ShowAllChildCubit.dart';
import 'package:scope_parent/Features/ChildDetails/Cubit/ShowChildDetailsCubit/ShowChildDetailsCubit.dart';
import 'package:scope_parent/Features/ChildEvaluations/Cubit/Month/ShowEvaluationsMonthCubit.dart';
import 'package:scope_parent/Features/Home/Cubit/RegistrationRequestStateCubit/ShowRegistrationRequestStateCubit.dart';
import 'package:scope_parent/Features/Homework/Cubit/HomeworkCubit.dart';
import 'package:scope_parent/Features/Invoices/Cubit/ShowInvoicesCubit.dart';
import 'package:scope_parent/Features/Login/Cubit/LoginCubit.dart';
import 'package:scope_parent/Features/Login/Presentation/LoginView.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scope_parent/Features/Register/Cubit/RegisterCubit.dart';
import 'package:scope_parent/Features/RegistrationRequest/Cubit/AddRegistrationRequestCubit.dart';
import 'Features/Appointment/Cubit/ShowAppointmentsStateCubit/ShowAppointmentsStateCubit.dart';
import 'Features/ChildEvaluations/Cubit/Day/ShowEvaluationsDayCubit.dart';
import 'Features/Home/Cubit/EditProfileCubit/EditProfileCubit.dart';
import 'Features/Home/Cubit/ShowProfileCubit/ShowProfileCubit.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ar')
        ],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale:const Locale('en'),
        //assetLoader: CodegenLoader(),
        child: const MyApp()
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return RegisterCubit();
        }),
        BlocProvider(create: (context) {
          return LoginCubit();
        }),
        BlocProvider(create: (context) {
          return ShowProfileCubit();
        }),
        BlocProvider(create: (context) {
          return EditProfileCubit();
        }),
        BlocProvider(create: (context) {
          return AddReservationCubit();
        }),
        BlocProvider(create: (context) {
          return ShowAppointmentCubit();
        }),
        BlocProvider(create: (context) {
          return AddRegistrationRequestCubit();
        }),
        BlocProvider(create: (context) {
          return ShowActivitiesCubit();
        }),
        BlocProvider(create: (context) {
          return HomeworkCubit();
        }),
        BlocProvider(create: (context) {
          return ShowAllChildCubit();
        }),
        BlocProvider(create: (context) {
          return ShowChildDetailsCubit();
        }),
        BlocProvider(create: (context) {
          return ShowInvoicesCubit();
        }),
        BlocProvider(create: (context) {
          return ShowAttendanceCubit();
        }),
        BlocProvider(create: (context) {
          return ShowEvaluationsDayCubit();
        }),
        BlocProvider(create: (context) {
          return ShowEvaluationsMonthCubit();
        }),
        BlocProvider(create: (context) {
          return ShowAppointmentsStateCubit();
        }),
        BlocProvider(create: (context) {
          return ShowRegistrationRequestStateCubit();
        }),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          body: LoginView(),
        ),
      ),
    );
  }
}
String ipServer="192.168.131.55";