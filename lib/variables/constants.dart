import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// VARIJABLE - stavljamo k ispred naziva jer je to naming convention
// style za text
const klabelTextStyle =
    TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold);
// style za brojeve
const kNumberTextStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.w900);
// height za container
const double kBottomContainerHeight = 80.0;
// COLORS
const Color kBackgroundColor = Color(0xff1d1128);
const Color kActiveCardColor = Color(0xFF6d72c3);
const Color kInactiveCardColor = Color(0xFF5941a9);

// LABELS
const String male = 'MALE';
const String female = 'FEMALE';
// ICONS
const IconData mars = FontAwesomeIcons.mars;
const IconData venus = FontAwesomeIcons.venus;

// INPUT PAGE variables
// COLORS

Color maleCardColor = kInactiveCardColor;
Color femaleCardColor = kInactiveCardColor;

// ENUM
enum Gender {
  male,
  female,
}

//SLIDER variables
double height = 170.0;
double kSliderMin = 120.0;
double kSliderMax = 220.0;
const Color kSliderActiveColor = Color(0xff1d1128);
const Color kSliderInactiveColor = Color(0xff8d8e98);
const Color kSliderOverlayColor = Color(0x29e5d4ed);

// bottom card variables
int weight = 60;
int age = 18;

// +/- button
const Color kButtonBackgroundColor = Color(0xff514f59);

// bottom container
const kBottomButtonTextStyle =
    TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold);
const Color kBottomContainerColor = Color(0xff514f59);

// results page
const kResultPageTitle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w700,
);

const kBmiTextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const kResultPageResult = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.w900,
);

const kResultDescription = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w400,
);
