import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget{


  TextFormFieldWidget({
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.validator,
    this.suffixIcon,
    required this.obscureText,
    this.type,
    this.onTap,
    required this.colorShadow,
    required this.colorText,
    required this.fontSize,
    required this.fontWeight,
    this.fontFamily,
    this.onChanged
  });

  TextEditingController controller=TextEditingController();
  String hintText;
  Icon icon;
  Widget? suffixIcon;
  String?  Function (String? value)? validator;
  bool obscureText;
  TextInputType? type;
  Function()? onTap;
  Color colorShadow;
  Color colorText;
  double  fontSize;
  FontWeight fontWeight;
  String? fontFamily;
  Function(String value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 350,
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white,
        //border: Border.all(color:const Color(0xFF3B436D),width: 1,),
        borderRadius: BorderRadius.circular(10),
        boxShadow:[
          BoxShadow(
            color: colorShadow,
            blurRadius: 10,
            offset: const Offset(2,2),
          ),
        ],
      ),
      child: TextFormField(
        onChanged:onChanged ,
        onTap: onTap,
        obscureText: obscureText,
        keyboardType: type,
        controller:controller,
        decoration:  InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          hintStyle:TextStyle(
            color: colorText,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily:fontFamily,
          ),
          prefixIcon: icon,
          suffixIcon: suffixIcon,
        ),
        validator: validator,
      ),
    );
  }
}