// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "Welcome Login Now": "مرحبا سجل دخول الأن",
  "Login": "سجل دخول",
  "Do not have an account?": "ليس لديك حساب؟",
  "Sign Up": "أنشئ حساب",
  "Enter PassWord": "أدخل رقم سر",
  "PassWord Length Should not be less than 6 characters": "رقم السر يجب ان يكون أكثر من ستة أحروف",
  "Enter Email": "أدخل البريد الألكتروني",
  "Enter Valid Email": "أدخل البريد الألكتروني فعال"
};
static const Map<String,dynamic> en = {
  "Welcome Login Now": "Welcome Login Now",
  "Login": "Login",
  "Do not have an account?": "Do not have an account?",
  "Sign Up": "Sign Up",
  "Enter PassWord": "Enter PassWord",
  "PassWord Length Should not be less than 6 characters": "PassWord Length Should not be less than 6 characters",
  "Enter Email": "Enter Email",
  "Enter Valid Email": "Enter Valid Email"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
