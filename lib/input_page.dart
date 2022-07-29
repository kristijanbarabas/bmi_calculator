import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/results_page.dart';
import 'package:bmi_calculator/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'variables/constants.dart';
import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'calculator_brain.dart';

// početni ekrana
// TU MIJENJAMO STATE
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

// state widget - property ne mora biti final kao u statelessu
class _InputPageState extends State<InputPage> {
  //metoda koja mijenja boju - male = 1, female = 2;
  void updateColor(Gender selectedGender) {
    setState(() {
      selectedGender == Gender.male
          ? maleCardColor = kActiveCardColor
          : maleCardColor = kInactiveCardColor;

      selectedGender == Gender.female
          ? femaleCardColor = kActiveCardColor
          : femaleCardColor = kInactiveCardColor;
    });

    /* // MALE CARD PRESSED
    if (gender == 1) {
      if (maleCardColor == inactiveCardColor) {
        maleCardColor = activeCardColor;
        // ako upalimo mušku karticu moramo ugasiti žensku karticu
        femaleCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
      }
    }
    // FEMALE CARD PRESSED
    if (gender == 2) {
      if (femaleCardColor == inactiveCardColor) {
        femaleCardColor = activeCardColor;
        // ako upalimo žensku karticu moramo ugasiti mušku
        maleCardColor = inactiveCardColor;
      } else {
        femaleCardColor = inactiveCardColor;
      }
    } */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        //  sa cross axis alignmentom containeri će zauzeti max veličinu ekrana bez obzira na veličinu childa
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // MALE
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableCard(
                  myFunction: () {
                    updateColor(Gender.male);
                  },
                  myColor: maleCardColor,
                  cardChild: const IconContent(label: male, icon: mars),
                ),
              ),
              // FEMALE
              Expanded(
                child: ReusableCard(
                  myFunction: () {
                    updateColor(Gender.female);
                  },
                  myColor: femaleCardColor,
                  cardChild: const IconContent(
                    label: female,
                    icon: venus,
                  ),
                ),
              ),
            ]),
          ),
          // HEIGHT
          Expanded(
            child: ReusableCard(
              myFunction: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    // ako koristimo CrossAxisAlignment.baseline moramo postaviti textBaseline property inače će nam se app srušiti
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        // sa toStringAsFixed postavljamo da double nema decimale
                        height.toStringAsFixed(0),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: klabelTextStyle,
                      ),
                    ],
                  ),
                  // da mijenjamo default izgleda slidera moramo koristiti slider theme, koja ima context (odnosno trenutno stanje našeg appa), tako da ako stavimo .of dobijemo kopiju kako to trenutno izgleda i onda možemo mijenjati po potrebi sa metodom copyWith() s kojom iskopiramo trenutne propertye i promjenimo one koje želimo
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: kSliderActiveColor,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kSliderInactiveColor,
                      overlayColor: kSliderOverlayColor,
                    ),
                    // SLIDER
                    child: Slider(
                      value: height,
                      min: kSliderMin,
                      max: kSliderMax,
                      // funkcija očekuje double kao input, postavljamo set state kako bi nam se slider animirao
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue;
                        });
                      },
                    ),
                  )
                ],
              ),
              myColor: kInactiveCardColor,
            ),
          ),
          // WEIGHT
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableCard(
                  myFunction: () {},
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: klabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                        ],
                      ),
                    ],
                  ),
                  myColor: kInactiveCardColor,
                ),
              ),
              // AGE
              Expanded(
                child: ReusableCard(
                  myFunction: () {},
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: klabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                        ],
                      ),
                    ],
                  ),
                  myColor: kInactiveCardColor,
                ),
              ),
            ]),
          ),
          // BUTTON na dnu ekrana
          BottomButton(
            buttonText: 'CALCULATE',
            onTap: () {
              // MOŽEMO KORISTITI NAMED RUTE AKO SMO IH DEFINIRALI U MATERIAL APPU ILI KREIRAMO NAVIGATOR.PUSH
              CalculatorBrain calculatorBrain =
                  CalculatorBrain(height: height.toInt(), weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                          bmiResult: calculatorBrain.calculateBMI(),
                          resultText: calculatorBrain.getResult(),
                          resultDescription:
                              calculatorBrain.getInterpretation())));
            },
          ),
        ],
      ),
    );
  }
}
