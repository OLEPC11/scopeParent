import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/Widgets/TextWidget.dart';
import '../../../Cubit/Month/ShowEvaluationsMonthCubit.dart';
import 'BoxEvaluationsArchiveWidget.dart';
import 'RowDateTextFormFieldWidget.dart';


class ChildEvaluationsArchiveViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RowDateTextFormFieldWidget(),
        BlocBuilder<ShowEvaluationsMonthCubit,ShowEvaluationsMonthState>(
          builder: (context,state){
            if(state is ShowEvaluationsMonthLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(state is ShowEvaluationsMonthSuccess ){
              return
                SizedBox(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount:state.evaluationsMonthModel.numberOfDay,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context,index) {
                      return BoxevaluationsArchiveWidget(
                        evaluationsMonthModel: state.evaluationsMonthModel,
                        index: index,
                      );
                    },
                  ),
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
        ),
        const SizedBox(height: 30,),
      ],
    );
  }
}
