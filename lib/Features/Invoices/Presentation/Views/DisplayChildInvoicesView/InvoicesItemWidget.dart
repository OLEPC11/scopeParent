import 'package:flutter/material.dart';
import 'package:scope_parent/Core/Widgets/CustomWidgets/ContainerWidget.dart';
import 'package:scope_parent/Core/Widgets/TextWidget.dart';
import 'package:scope_parent/Features/Invoices/Data/Model/InvoicesModel.dart';

class  InvoicesItemWidget extends StatelessWidget {
  InvoicesItemWidget({required this.invoicesModel});
  InvoicesModel invoicesModel;
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 30,),
      width: 220, height: 180,
      widget: Stack(
        children: [
          Positioned(
            top: 10, left: 10, right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "Paid Invoices :",
                  color:const Color(0xFF7DA4FF),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit",
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/Logo.png"),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
              top: 85, left: 10,
              child: Icon(Icons.calendar_today_outlined ,size: 20,color: Color(0xFFAC8FCF),)
          ),
          Positioned(
            top: 85, left: 70, right: 130,
            child: TextWidget(
              text:invoicesModel.invoiceDate,
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
          const Positioned(
              top: 122,
              left: 12,
              child: Icon(Icons.monetization_on ,size: 22,color: Color(0xFFAC8FCF),)
          ),
          Positioned(
            top: 120, left: 70, right: 160,
            child: TextWidget(
              text: "${invoicesModel.invoiceAmount}",
              color:const Color(0xFF7DA4FF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
            ),
          ),
        ],
      ),
    );
  }
}














