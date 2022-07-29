import 'dart:math';

// klasa za izračun BMI
class CalculatorBrain {
  // height je u cm
  final int height;
  // weight je u kg
  final int weight;

  CalculatorBrain({required this.height, required this.weight});

  // bmi postavimo kao private varijablu kako bismo ju mogli koristiti unutar metoda ove klase
  late double _bmi;

//vraćamo rezultat kao String koristeći funkciju toStringAsFixed(1) s jednom decimalom
  String calculateBMI() {
    // koristimo darth math library kako bismo dobili funkciju pow() koja omogućuje korištenje expontenta
    // budući da je height u cm podijelimo ga sa 100 da dobijemo visinu u metrima
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

// metoda kojom dobijemo rezultat
  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.50) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  // metoda kojom dobijemo opis

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.50) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}

/* How to calculate Body Mass Index
Body Mass Index is a simple calculation using a person’s height and weight. The formula is BMI = kg/m2 where kg is a person’s weight in kilograms and m2 is their height in metres squared.

A BMI of 25.0 or more is overweight, while the healthy range is 18.5 to 24.9. BMI applies to most adults 18-65 years. */
