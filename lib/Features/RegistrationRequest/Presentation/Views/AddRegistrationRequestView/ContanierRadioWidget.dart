import 'package:flutter/material.dart';

class  ContanierRadioWidget extends StatelessWidget{

  ContanierRadioWidget({
    required this.child,
  });
  Widget child;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 10,
        child: child,
      ),
    );
  }
}