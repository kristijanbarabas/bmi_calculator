import 'package:bmi_calculator/variables/constants.dart';
import 'package:flutter/material.dart';

// custom ROUND ICON BUTTON widget
class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundIconButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      fillColor: kButtonBackgroundColor,
      // DIMENZIJE WIDGETA
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      child: Icon(icon),
    );
  }
}
