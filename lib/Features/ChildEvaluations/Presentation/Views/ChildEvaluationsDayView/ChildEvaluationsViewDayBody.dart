import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/ChildEvaluations/Cubit/Month/ShowEvaluationsMonthCubit.dart';
import '../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../main.dart';
import '../../../Cubit/Day/ShowEvaluationsDayCubit.dart';
import '../ChildEvaluationsView/BoxEvaluationsWidget.dart';
import '../ChildEvaluationsView/ChildInfoWidget.dart';
import 'BoxEvaluationsDayWidget.dart';

class ChildEvaluationsViewDayBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<ShowEvaluationsDayCubit,ShowEvaluationsDayState>(
        builder: (context,state){
          if(state is ShowEvaluationsDayLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state is ShowEvaluationsDaySuccess ){
            return  ListView(
              children: [
                ChildInfoWidget(
                  childImage: "http://$ipServer:8000/${state.evaluationsDayModel.childImagePath}/${state.evaluationsDayModel.childImageName}",
                  childName: "${state.evaluationsDayModel.childName}",
                  type: "${state.evaluationsDayModel.childCategory}",
                ),
                BoxEvaluationsDayWidget(
                  index: 0,
                  evaluationsDayModel:state.evaluationsDayModel,
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            );
          }
          else if(state is ShowEvaluationsDayFailure){
            print(state.errorMessage);
            return Center(
              child:TextWidget(
                text:"There Is No Evaluations Available",
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
                text:"There Is No Evaluations Available",
                color:const Color(0xFF7DA4FF),
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: "Outfit",
              ),
            );
          }},
      );
  }
}
