import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color pBlack = Color(0xFF0C0C0C);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey1 = Color(0xFF181818);
  static const Color grey2 = Color(0xFF222222);
  static const Color grey3 = Color(0xFF2C2C2C);
  static const Color grey4 = Color(0xFF484848);
  static const Color green = Color(0xFF7FC894);
  static const Color darkGreen = Color(0xFF00671E);
  static const Color yellow = Color(0xFFFFC773);
  static const Color darkYellow = Color(0xFF5D4830);
  static const Color red = Color(0xFFC25F6C);
  static const Color darkRed = Color(0xFF71000F);
  static const Color violet = Color(0xFF9E8FF9);
  static const Color darkViolet = Color(0xFF453E72);

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: green,
    primarySwatch: Colors.grey,
    fontFamily: 'Inter',
    scaffoldBackgroundColor: pBlack,
  );

  static final TextStyles textStyles = TextStyles._();
}

class TextStyles {
  TextStyles._();

  static TextStyle h1() {
    return const TextStyle(fontSize: 40);
  }

  static TextStyle h2() {
    return const TextStyle(fontSize: 32);
  }

  static TextStyle h3() {
    return const TextStyle(fontSize: 24);
  }

  static TextStyle body() {
    return const TextStyle(fontSize: 16);
  }
}
