import 'package:flutter/material.dart';

import 'theme/custom_color_scheme.dart';

class AppTheme {
  AppTheme._();

  static const String appBarFont = 'Lobster';
  static const String titleFont = 'Righteous';

  static ThemeData themeData(BuildContext context) => ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          centerTitle: true,
          shadowColor: Colors.black26,
          titleTextStyle: TextStyle(
            color: Colors.grey.shade800,
            fontFamily: titleFont,
            fontSize: 18,
          ),
          iconTheme: IconThemeData(
            color: Colors.grey.shade800,
          ),
        ),
        shadowColor: Colors.black26,
        backgroundColor: Colors.white,
        textTheme: _textTheme(),
        elevatedButtonTheme: _elevatedButtonThemeData(),
        extensions: [
          CustomColorScheme(
            infoColor: Colors.blueGrey,
            successColor: Colors.green,
            warningColor: Colors.yellow,
            dangerColor: Colors.red,
            placeholderColor: Colors.grey.shade200,
          ),
        ],
      );

  static ElevatedButtonThemeData _elevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
      );

  static TextTheme _textTheme() => const TextTheme(
        headline4: TextStyle(
          fontFamily: titleFont,
        ),
        headline6: TextStyle(
          fontFamily: titleFont,
        ),
        bodyText2: TextStyle(),
      );
}
