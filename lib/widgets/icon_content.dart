import 'package:flutter/material.dart';
import 'package:bmi_calculator/variables/constants.dart';

// icon widget za spol
class IconContent extends StatelessWidget {
  final String label;
  final IconData icon;

  const IconContent({Key? key, required this.label, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: klabelTextStyle,
        )
      ],
    );
  }
}
