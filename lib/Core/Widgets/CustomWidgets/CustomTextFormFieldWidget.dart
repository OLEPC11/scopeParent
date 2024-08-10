import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../Core/Widgets/TextFormFieldWidget.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  CustomTextFormFieldWidget({
    required this.hintText,
    required this.controller,
    this.validator,
    required this.obscureText,
    required this.icon,
    this.suffixIcon,
    this.onTap,
    this.type,
    this.onChanged,
  });

  TextEditingController controller=TextEditingController();
  bool obscureText;
  String hintText;
  Icon icon;
  Function()? onTap;
  TextInputType? type;
  Widget? suffixIcon;
  String?  Function (String? value)? validator;
  Function(String value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      onChanged:onChanged,
      onTap: onTap,
      obscureText: obscureText,
      controller: controller,
      hintText: hintText,
      colorText: const Color(0xFF7DA4FF),
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: "Outfit",
      type: type,
      icon:icon,
      colorShadow: const Color(0xFFAC8FCF),
      suffixIcon: suffixIcon,
      validator: validator,
    );
  }
}