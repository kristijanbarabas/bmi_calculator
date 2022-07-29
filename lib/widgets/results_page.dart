import 'package:flutter/material.dart';
import 'package:bmi_calculator/variables/constants.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String resultDescription;

  const ResultsPage({
    Key? key,
    required this.bmiResult,
    required this.resultText,
    required this.resultDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            // SA ALIGN WIDGETOM MOŽEMO POSTAVITI TEXT DA BUDE NA LIJEVOJ STRANI
            child: Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(left: 15.0),
              child: const Text(
                'Your Result',
                style: kResultPageTitle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            // ubacujemo naš custom kreirani widget
            child: ReusableCard(
              myColor: kActiveCardColor,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kResultPageResult,
                    ),
                    Text(
                      bmiResult.toUpperCase(),
                      style: kBmiTextStyle,
                    ),
                    Text(
                      resultDescription,
                      style: kResultDescription,
                      textAlign: TextAlign.center,
                    ),
                  ]),
              myFunction: () {},
            ),
          ),
          BottomButton(
              buttonText: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
