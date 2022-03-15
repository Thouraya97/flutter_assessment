import 'package:flutter/material.dart';

class Colors {

  const Colors();


  static const Color appBarTitle = const Color(0xFFFFFFFF);
  static const Color appBarIconColor = const Color(0xFFFFFFFF);
  static const Color appBarDetailBackground = const Color(0x00FFFFFF);
  static const Color appBarGradientStart = const Color(0xFF3383FC);
  static const Color appBarGradientEnd = const Color(0xFF00C6FF);

  static const Color contactCard = const Color(0xFF8685E5);
  static const Color contactPageBackground = const Color(0xFF736AB7);
  static const Color contactTitle = const Color(0xFFFFFFFF);
  static const Color contactPhone = const Color(0x66FFFFFF);
  static const Color contactCheckIn = const Color(0x66FFFFFF);

}

class Dimens {
  const Dimens();

  static const contactWidth = 100.0;
  static const contactHeight = 100.0;
}

class TextStyles {

  const TextStyles();

  static const TextStyle appBarTitle = const TextStyle(
    color: Colors.appBarTitle,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 36.0
  );

  static const TextStyle user = const TextStyle(
    color: Colors.contactTitle,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 24.0
  );

  static const TextStyle phone = const TextStyle(
    color: Colors.contactPhone,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    fontSize: 14.0
  );

  static const TextStyle check_in = const TextStyle(
    color: Colors.contactCheckIn,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    fontSize: 12.0
  );


}