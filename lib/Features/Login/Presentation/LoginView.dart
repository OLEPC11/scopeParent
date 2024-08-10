import 'package:flutter/material.dart';

import 'Views/LoginView/LoginViewBody.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView > createState()=>_LoginViewState();
}

class _LoginViewState extends State<LoginView>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: const Color(0xFF363567),
      backgroundColor:Colors.white,
      body:LoginViewBody(),
    );
  }
}