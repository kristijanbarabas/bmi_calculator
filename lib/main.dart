import 'package:bmi_calculator/variables/constants.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(const BMICalculator());

// root
class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // OVDJE MOŽEMO UBACITI NAŠU SLIDER TEMU PA BI SVI SLIDERI JEDNAKO IZGLEDALI, ALI BUDUĆI DA IMAMO JEDAN SLIDER OSTAVIT ĆEMO KOD TAMO GDJE JE
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            color: kBackgroundColor,
            titleTextStyle:
                TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          scaffoldBackgroundColor: kBackgroundColor),
      debugShowCheckedModeBanner: false,
      /* // za navigaciju između stranica možemo koristiti routes a za početnu ili initialRoute ili home, ne možemo oboje
        initialRoute: '/',
        routes: {
          // ovo je u stvari mapa, gdje je key neki String a vrijednost je funkcija = (context) => NekaStranica odnosno builder
          '/': (context) => InputPage(),
          '/results_page': (context) => ResultsPage(ovdje idu konstruktori ali budući da se state appa mijenja na input pageu ne kreiramo named rutu),
        } */
      home: const InputPage(),
    );
  }
}
