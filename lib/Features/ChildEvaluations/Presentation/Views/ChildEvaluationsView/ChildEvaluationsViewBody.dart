import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/ChildEvaluations/Cubit/Month/ShowEvaluationsMonthCubit.dart';
import '../../../../../Core/Widgets/TextWidget.dart';
import '../../../../../main.dart';
import 'BoxEvaluationsWidget.dart';
import 'ChildInfoWidget.dart';


class ChildEvaluationsViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ShowEvaluationsMonthCubit,ShowEvaluationsMonthState>(
      builder: (context,state){
        if(state is ShowEvaluationsMonthLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(state is ShowEvaluationsMonthSuccess ){
          return  ListView(
            children: [
              ChildInfoWidget(
                childImage: "http://$ipServer:8000/${state.evaluationsMonthModel.childImagePath}/${state.evaluationsMonthModel.childImageName}",
                childName: "${state.evaluationsMonthModel.childName}",
                type: "${state.evaluationsMonthModel.childCategory}",
              ),
              SizedBox(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount:state.evaluationsMonthModel.numberOfDay,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context,index) {
                    return BoxEvaluationsWidget(
                      evaluationsModel:state.evaluationsMonthModel,
                      index: index,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          );
        }
        else if(state is ShowEvaluationsMonthFailure){
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
