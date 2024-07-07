import 'package:bmi_calculator/ConstantFile.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class repeatTextIconWidget extends StatelessWidget {
  repeatTextIconWidget({ this.iconData, this.label});
  final IconData iconData;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 70.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label, style: klabelStyle)
      ],
    );
  }
}
