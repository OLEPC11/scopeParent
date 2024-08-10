import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/Activities/Cubit/ShowActivitiesCubit.dart';
import 'package:scope_parent/Features/Activities/Presentation/DisplayActivitiesView.dart';
import 'package:scope_parent/Features/Appointment/Cubit/ShowAppointmentCubit/ShowAppointmentCubit.dart';
import 'package:scope_parent/Features/Appointment/Presentation/DisplayAppointmentView.dart';
import 'package:scope_parent/Features/ChildDetails/Cubit/ShowAllChildCubit/ShowAllChildCubit.dart';
import 'package:scope_parent/Features/ChildDetails/Presentation/DisplayChildView.dart';
import 'package:scope_parent/Features/ChildEvaluations/Presentation/InfoForDisplayChildEvaluationsView.dart';
import 'package:scope_parent/Features/HomeWork/Presentation/InfoForDisplayChildHomeworkView.dart';
import 'package:scope_parent/Features/Invoices/Presentation/DisplayChildrenView.dart';
import '../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../Attendance/Presentation/InfoForDisplayChildAttendanceView.dart';
import '../../../../RegistrationRequest/Presentation/AddRegistrationRequestView.dart';
class  HomeItemWidget extends StatelessWidget {
  List cateNames=[
    LocaleKeys.Registration_Request.tr(),
    LocaleKeys.Reservation.tr(),
    LocaleKeys.Invoices.tr(),
    LocaleKeys.Child_Details.tr(),
    LocaleKeys.Activities.tr(),
    LocaleKeys.Evaluation1.tr(),
    LocaleKeys.Attendance.tr(),
    LocaleKeys.Homework.tr(),
  ];
  List cateImages=[
    "assets/images/RegistrationRequest.jpg",
    "assets/images/Reservations.jpg",
    "assets/images/Invoices.jpg",
    "assets/images/ChildDetails2.jpg",
    "assets/images/Activities1.jpg",
    "assets/images/Attendance&Evaluation.jpg",
    "assets/images/Attendance.jpg",
    "assets/images/Homework.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        child:  GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.1,
          ),
          itemCount: cateNames.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                if(index==0){
                  Navigator.push(context, MaterialPageRoute(
                      builder:(BuildContext context){
                        return AddRegistrationRequestView();
                      }),
                  );
                }
                if(index==1){
                  BlocProvider.of<ShowAppointmentCubit>(context).showAppointmentServices();
                  Navigator.push(context, MaterialPageRoute(
                      builder:(BuildContext context){
                        return DisplayAppointmentView();
                      }),
                  );
                }
                if(index==2){
                  BlocProvider.of<ShowAllChildCubit>(context).showAllChildServices(
                    accessToken: BlocProvider.of<ShowAllChildCubit>(context).accessToken,
                  );
                  Navigator.push(context, MaterialPageRoute(
                      builder:(BuildContext context){
                        return DisplayChildrenView();
                      }),
                  );
                }
                if(index==3){
                  BlocProvider.of<ShowAllChildCubit>(context).showAllChildServices(
                    accessToken: BlocProvider.of<ShowAllChildCubit>(context).accessToken,
                  );
                  Navigator.push(context, MaterialPageRoute(
                      builder:(BuildContext context){
                        return DisplayChildView();
                      }),
                  );
                }
                if(index==4){
                  BlocProvider.of<ShowActivitiesCubit>(context).showActivitiesServices();
                  Navigator.push(context, MaterialPageRoute(
                      builder:(BuildContext context){
                        return DisplayActivitiesView();
                      }),
                  );
                }
                if(index==5){
                  Navigator.push(context, MaterialPageRoute(
                      builder:(BuildContext context){
                        return InfoForDisplayChildEvaluationsView();
                      }),
                  );
                }
                if(index==6){
                  Navigator.push(context, MaterialPageRoute(
                      builder:(BuildContext context){
                        return InfoForDisplayChildAttendanceView();
                      }),
                  );
                }
                if(index==7){
                  Navigator.push(context, MaterialPageRoute(
                      builder:(BuildContext context){
                        return InfoForDisplayChildHomeworkView();
                      }),
                  );
                }
              },
              child: Column(
                children: [
                  Container(
                    height: 140,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:const Color(0xFFD4E7FE),
                      //shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(cateImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  TextWidget(
                    text:cateNames[index],
                    color:const Color(0xFF7DA4FF),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit",
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
