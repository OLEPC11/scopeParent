import 'package:flutter/material.dart';

class DateTextFormFieldWidget extends StatelessWidget{
  
  DateTextFormFieldWidget({
    required this.icon,
    required this.list,
    required this.selectedTextFiledItem,
    required this.onChanged,
  });

  List<DropdownMenuItem<String>>list;
  Icon icon;
  String selectedTextFiledItem;
  Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height:56,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow:const [
          BoxShadow(
            color:  Color(0xFFAC8FCF),
            blurRadius: 10,
            offset: Offset(2,2),
          ),
        ],
      ),
      child:DropdownButtonFormField(
        value: selectedTextFiledItem,
        items:list,
        onChanged:onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style:const TextStyle(
          color: Color(0xFF7DA4FF),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        icon: icon,
      ),
    );
  }
}