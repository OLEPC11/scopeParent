import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/Activities/Cubit/ShowActivitiesCubit.dart';
import 'package:scope_parent/Features/Activities/Presentation/DisplayActivitiesView.dart';
import 'package:scope_parent/Features/Appointment/Cubit/ShowAppointmentCubit/ShowAppointmentCubit.dart';
import 'package:scope_parent/Features/Appointment/Presentation/DisplayAppointmentView.dart';
import 'package:scope_parent/Features/ChildDetails/Cubit/ShowAllChildCubit/ShowAllChildCubit.dart';
import 'package:scope_parent/Features/ChildDetails/Presentation/DisplayChildView.dart';
import 'package:scope_parent/Features/ChildEvaluations/Presentation/DisplayChildrenEvaluationsView.dart';
import 'package:scope_parent/Features/Invoices/Presentation/DisplayChildrenView.dart';
import '../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../Attendance/Presentation/DisplayChildrenAttendanceView.dart';
import '../../../../Homework/Presentation/DisplayChildHomeworkView.dart';
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
                  BlocProvider.of<ShowAllChildCubit>(context).showAllChildServices(
                    accessToken: BlocProvider.of<ShowAllChildCubit>(context).accessToken,
                  );
                  Navigator.push(context, MaterialPageRoute(
                      builder:(BuildContext context){
                        return DisplayChildrenEvaluationsView();
                      }),
                  );
                }
                if(index==6){
                  BlocProvider.of<ShowAllChildCubit>(context).showAllChildServices(
                    accessToken: BlocProvider.of<ShowAllChildCubit>(context).accessToken,
                  );
                  Navigator.push(context, MaterialPageRoute(
                      builder:(BuildContext context){
                        return DisplayChildrenAttendanceView();
                      }),
                  );
                }
                if(index==7){
                  BlocProvider.of<ShowAllChildCubit>(context).showAllChildServices(
                    accessToken: BlocProvider.of<ShowAllChildCubit>(context).accessToken,
                  );
                  Navigator.push(context, MaterialPageRoute(
                      builder:(BuildContext context){
                        return DisplayChildHomeworkView();
                      }),
                  );
                }
              },
              child:SizedBox(
                height: 180,width: 140,
                child:
                Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color(0xFFAC8FCF),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(bottom: 10,left: 20,right: 20,top:20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 2,),
                      Padding(
                        padding: const EdgeInsets.only(
                          top:10,
                          left: 30,
                          right: 30,
                        ),
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(cateImages[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      index==0?
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                          left:  10,
                          right: 10,),
                        child: TextWidget(
                          text:cateNames[index],
                          color:const Color(0xFF7DA4FF),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Outfit",
                        ),
                      ):index==3?
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                          left: 40,
                          right: 25,),
                        child: TextWidget(
                          text:cateNames[index],
                          color:const Color(0xFF7DA4FF),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Outfit",
                        ),
                      ):
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                          left: 45,
                          right: 25,),
                        child: TextWidget(
                          text:cateNames[index],
                          color:const Color(0xFF7DA4FF),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Outfit",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
            // ):
            // GestureDetector(
            //   onTap: (){
            //     if(index==0){
            //       Navigator.push(context, MaterialPageRoute(
            //           builder:(BuildContext context){
            //             return AddRegistrationRequestView();
            //           }),
            //       );
            //     }
            //     if(index==1){
            //       BlocProvider.of<ShowAppointmentCubit>(context).showAppointmentServices();
            //       Navigator.push(context, MaterialPageRoute(
            //           builder:(BuildContext context){
            //             return DisplayAppointmentView();
            //           }),
            //       );
            //     }
            //     if(index==2){
            //       BlocProvider.of<ShowAllChildCubit>(context).showAllChildServices(
            //         accessToken: BlocProvider.of<ShowAllChildCubit>(context).accessToken,
            //       );
            //       Navigator.push(context, MaterialPageRoute(
            //           builder:(BuildContext context){
            //             return DisplayChildrenView();
            //           }),
            //       );
            //     }
            //     if(index==3){
            //       BlocProvider.of<ShowAllChildCubit>(context).showAllChildServices(
            //         accessToken: BlocProvider.of<ShowAllChildCubit>(context).accessToken,
            //       );
            //       Navigator.push(context, MaterialPageRoute(
            //           builder:(BuildContext context){
            //             return DisplayChildView();
            //           }),
            //       );
            //     }
            //     if(index==4){
            //       BlocProvider.of<ShowActivitiesCubit>(context).showActivitiesServices();
            //       Navigator.push(context, MaterialPageRoute(
            //           builder:(BuildContext context){
            //             return DisplayActivitiesView();
            //           }),
            //       );
            //     }
            //     if(index==5){
            //       BlocProvider.of<ShowAllChildCubit>(context).showAllChildServices(
            //         accessToken: BlocProvider.of<ShowAllChildCubit>(context).accessToken,
            //       );
            //       Navigator.push(context, MaterialPageRoute(
            //           builder:(BuildContext context){
            //             return DisplayChildrenEvaluationsView();
            //           }),
            //       );
            //     }
            //     if(index==6){
            //       BlocProvider.of<ShowAllChildCubit>(context).showAllChildServices(
            //         accessToken: BlocProvider.of<ShowAllChildCubit>(context).accessToken,
            //       );
            //       Navigator.push(context, MaterialPageRoute(
            //           builder:(BuildContext context){
            //             return DisplayChildrenAttendanceView();
            //           }),
            //       );
            //     }
            //     if(index==7){
            //       BlocProvider.of<ShowAllChildCubit>(context).showAllChildServices(
            //         accessToken: BlocProvider.of<ShowAllChildCubit>(context).accessToken,
            //       );
            //       Navigator.push(context, MaterialPageRoute(
            //           builder:(BuildContext context){
            //             return DisplayChildHomeworkView();
            //           }),
            //       );
            //     }
            //   },
            //   child:SizedBox(
            //     height: 170,width: 140,
            //     child:
            //     Card(
            //       shape: RoundedRectangleBorder(
            //         side: const BorderSide(
            //           color: Color(0xFFAC8FCF),
            //         ),
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //       margin: const EdgeInsets.only(bottom: 20,left: 20,right: 20,top: 30),
            //       child: Stack(
            //         children: [
            //           Positioned(
            //             top:10,
            //             left: 30,
            //             right: 30,
            //             child: Container(
            //               height: 90,
            //               width: 90,
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(20),
            //                 image: DecorationImage(
            //                   image: AssetImage(cateImages[index]),
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //             ),
            //           ),
            //           index==0?Positioned(
            //             bottom: 10,
            //             left: 40,
            //             right: 40,
            //             child: TextWidget(
            //               text:cateNames[index],
            //               color:const Color(0xFF7DA4FF),
            //               fontSize: 13,
            //               fontWeight: FontWeight.bold,
            //               fontFamily: "Outfit",
            //             ),
            //           ):index==3?Positioned(
            //             bottom: 10,
            //             left: 40,
            //             right: 40,
            //             child: TextWidget(
            //               text:cateNames[index],
            //               color:const Color(0xFF7DA4FF),
            //               fontSize: 13,
            //               fontWeight: FontWeight.bold,
            //               fontFamily: "Outfit",
            //             ),
            //           ):index==7?Positioned(
            //             bottom: 10,
            //             left: 40,
            //             right: 40,
            //             child: TextWidget(
            //               text:cateNames[index],
            //               color:const Color(0xFF7DA4FF),
            //               fontSize: 13,
            //               fontWeight: FontWeight.bold,
            //               fontFamily: "Outfit",
            //             ),
            //           ):Positioned(
            //             bottom: 10,
            //             left: 60,
            //             right: 60,
            //             child: TextWidget(
            //               text:cateNames[index],
            //               color:const Color(0xFF7DA4FF),
            //               fontSize: 13,
            //               fontWeight: FontWeight.bold,
            //               fontFamily: "Outfit",
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
