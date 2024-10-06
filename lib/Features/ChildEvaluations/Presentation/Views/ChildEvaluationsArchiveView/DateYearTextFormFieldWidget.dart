import 'package:flutter/material.dart';

class DateYearTextFormFieldWidget extends StatelessWidget{


  DateYearTextFormFieldWidget({
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.validator,
    this.suffixIcon,
    required this.obscureText,
    this.type,
    this.onTap,
    this.onChanged,
  });

  TextEditingController controller=TextEditingController();
  String hintText;
  Icon icon;
  Widget? suffixIcon;
  String?  Function (String? value)? validator;
  bool obscureText;
  TextInputType? type;
  Function()? onTap;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 150,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color:const Color(0xFF3B436D),width: 1,),
        borderRadius: BorderRadius.circular(10),
        boxShadow:const [
          BoxShadow(
            color: Color(0xFFAC8FCF),
            blurRadius: 10,
            offset: Offset(2,2),
          ),
        ],
      ),
      child: TextFormField(
        onChanged: onChanged,
        onTap: onTap,
        obscureText: obscureText,
        keyboardType: type,
        controller:controller,
        decoration:  InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          hintStyle:const TextStyle(
            color: Color(0xFF7DA4FF),
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: "Outfit",
          ),
          prefixIcon: icon,
          suffixIcon: suffixIcon,
        ),
        validator: validator,
      ),
    );
  }
}