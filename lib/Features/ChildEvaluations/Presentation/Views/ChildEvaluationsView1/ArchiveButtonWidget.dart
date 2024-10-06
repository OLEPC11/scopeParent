import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/ChildEvaluations/Data/Model/EvaluationsDayModel.dart';
import 'package:scope_parent/Features/ChildEvaluations/Presentation/ChildEvaluationsArchiveView.dart';

import '../../../../../Core/Widgets/CustomWidgets/CustomButtonWidget.dart';
import '../../../Cubit/Month/ShowEvaluationsMonthCubit.dart';

class ArchiveButtonWidget extends StatelessWidget{
  ArchiveButtonWidget({required this.evaluationsDayModel});
  EvaluationsDayModel evaluationsDayModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
      child: CustomButtonWidget(
        onTap: (){
          BlocProvider.of<ShowEvaluationsMonthCubit>(context).showShowEvaluationsMonthServices(
            nameChild: evaluationsDayModel.childName,
            categoryClass:evaluationsDayModel.childCategory,
            accessToken:  BlocProvider.of<ShowEvaluationsMonthCubit>(context).accessToken,
            type: "month"
          );
          Navigator.push(context, MaterialPageRoute(
              builder:(BuildContext context){
                return ChildEvaluationsArchiveView();
              }),);
        },
        text: "Archive",
      ),
    );
  }
}
