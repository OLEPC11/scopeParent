import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/Homework/Cubit/ShowResponseCubit/ShowResponseCubit.dart';
import 'package:scope_parent/Features/Homework/Presentation/Views/ShowResponsesView/ResponseItemWidget.dart';
import '../../../../../Core/Widgets/TextWidget.dart';
import 'RowDateResponseDayTextFormFieldWidget.dart';


class  ShowResponsesViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RowDateResponseDayTextFormFieldWidget(),
        BlocBuilder<ShowResponseCubit,ShowResponseState>(
          builder: (context,state){
            if(state is ShowResponseLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(state is ShowResponseSuccess ){
              return   SizedBox(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:state.responseModel.length,
                  itemBuilder: (BuildContext context,index) {
                    return ResponseItemWidget(responseModel: state.responseModel[index],);},),
              );
            }
            else if(state is ShowResponseFailure){
              print(state.errorMessage);
              return Center(
                child:TextWidget(
                  text:"There Is No Response Available",
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
                  text:"There Is No Response Available",
                  color:const Color(0xFF7DA4FF),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit",
                ),
              );
            }},
        )
      ],
    );
  }
}
