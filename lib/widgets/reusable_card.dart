import 'package:flutter/material.dart';

// kada extractamo widget flutter automatski kreira potreban kod i možemo ga odmah koristiti
// statelesswidget se ne mijenja jer nemaju state
class ReusableCard extends StatelessWidget {
  // KEY JE IDENTIFIKATOR KOJIM PRATI STATE WIDGET, KORISNO KADA SE WIDGETI POMIČU U WIDGET TREEU, NAROČITO KADA SU ANIMACIJE ILI SCROLL
  // DEFAULT CONSTRUCTOR:
  /* const ReusableCard({
    Key? key,
  }) : super(key: key); */
  /*KREIRAMO KONSTRUKTOR (mijenjamo boju)
  1. kreiramo property(field) color bez vrijednosti data type je Color a ime propertya je color, postavimo kao final da property bude imutable. tj. da se ne može promjeniti
 
*/
  final Color myColor;
  // custom child property
  final Widget cardChild;
  // 2. kreiramo konstruktor; postavimo default vrijednost u konstruktor koju možemo promjeniti kada pozivamo widget pomoću propertya color koji smo kreirali
  // kreiramo property func
  // ako stavimo data type Function neće raditi jer je onTap void Function() data type pa moramo staviti VoidCallback kao data type da funckionira
  final VoidCallback myFunction;

  const ReusableCard(
      {Key? key,
      required this.myColor,
      required this.cardChild,
      required this.myFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myFunction,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        // border radius
        decoration: BoxDecoration(
            // ubacili smo kreirani property u property containera
            color: myColor,
            borderRadius: BorderRadius.circular(10.0)),
        child: cardChild,
      ),
    );
  }
}
