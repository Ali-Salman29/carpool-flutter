import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: kBackgroundColor,
      backgroundColor: kBackgroundColor,
      dialogBackgroundColor: kBackgroundColor,
      fontFamily: 'Montserrat',
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      primaryColor: kPrimaryColor,
      colorScheme: const ColorScheme(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        error: kErrorColor,
        surface: kBackgroundColor,
        onSurface: kTextColor,
        background: kBackgroundColor,
        onBackground: kTextColor,
        onPrimary: kTextColor,
        onSecondary: kTextColor,
        brightness: Brightness.light,
        onError: kErrorColor,
      ),
      canvasColor: kBackgroundColor,
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: const IconThemeData(color: kIconColor),
      listTileTheme: const ListTileThemeData(iconColor: kIconColor),
      timePickerTheme: const TimePickerThemeData(
          helpTextStyle: TextStyle(color: kTextLightColor)));
}

InputDecorationTheme inputDecorationTheme() {
  UnderlineInputBorder enabledBorder = const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white30, width: 2),
  );
  UnderlineInputBorder focusedBorder = const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.greenAccent, width: 2));

  return InputDecorationTheme(
    iconColor: kIconColor,
    labelStyle: const TextStyle(color: kTextLightColor),
    hintStyle: const TextStyle(color: kTextLightColor),
    enabledBorder: enabledBorder,
    focusedBorder: focusedBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(color: kTextColor, fontWeight: FontWeight.w700),
    headline2: TextStyle(color: kTextColor, fontWeight: FontWeight.w600),
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
    subtitle1: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: kBackgroundColor,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  );
}
