import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scope_parent/Features/Invoices/Cubit/ShowInvoicesCubit.dart';
import 'package:scope_parent/Features/Invoices/Presentation/Views/DisplayChildInvoicesView/InvoicesItemWidget.dart';

import '../../../../../Core/Widgets/TextWidget.dart';

class  DisplayChildInvoicesViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowInvoicesCubit,ShowInvoicesState>(
      builder: (context,state){
        if(state is ShowInvoicesLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(state is ShowInvoicesSuccess){
          return  SizedBox(
            child:  ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount:state.invoicesModel.length,
              itemBuilder: (BuildContext context,index) {
                return InvoicesItemWidget(invoicesModel: state.invoicesModel[index],);
              },
            ),
          );
        }
        else if(state is ShowInvoicesFailure){
          return Center(
            child:TextWidget(
              text:"There Is Error",
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
              text:"There Is No Invoices Available",
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          );
        }
      },
    );
  }
}
