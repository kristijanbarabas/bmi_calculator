import 'package:flutter/material.dart';
import 'package:bmi_calculator/variables/constants.dart';

// BOTTOM BUTTON
class BottomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;

  const BottomButton({Key? key, required this.buttonText, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        // vrijednost koja je jednaka širini cijelog ekrana
        width: double.infinity,
        // height prema varijabli koju smo prije definirali
        height: kBottomContainerHeight,
        child: Center(
          child: Text(buttonText, style: kBottomButtonTextStyle),
        ),
      ),
    );
  }
}
