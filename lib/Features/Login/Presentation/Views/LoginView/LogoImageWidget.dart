import 'package:flutter/material.dart';

class LogoImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: CircleAvatar(
        radius:130,
        backgroundImage: AssetImage("assets/images/Logo.png"),
      ),
    );
  }
}
