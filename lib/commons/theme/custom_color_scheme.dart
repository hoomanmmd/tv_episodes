import 'package:flutter/material.dart';

class CustomColorScheme extends ThemeExtension<CustomColorScheme> {
  CustomColorScheme({
    required this.successColor,
    required this.infoColor,
    required this.warningColor,
    required this.dangerColor,
    required this.placeholderColor,
  });

  Color successColor;
  Color infoColor;
  Color warningColor;
  Color dangerColor;
  Color placeholderColor;

  @override
  CustomColorScheme copyWith({
    Color? successColor,
    Color? infoColor,
    Color? warningColor,
    Color? dangerColor,
    Color? placeholderColor,
  }) =>
      CustomColorScheme(
        successColor: successColor ?? this.successColor,
        infoColor: infoColor ?? this.infoColor,
        warningColor: warningColor ?? this.warningColor,
        dangerColor: dangerColor ?? this.dangerColor,
        placeholderColor: placeholderColor ?? this.placeholderColor,
      );

  @override
  CustomColorScheme lerp(
    ThemeExtension<CustomColorScheme>? other,
    double t,
  ) {
    if (other is! CustomColorScheme) {
      return this;
    }

    return CustomColorScheme(
      successColor: Color.lerp(successColor, other.successColor, t)!,
      infoColor: Color.lerp(infoColor, other.infoColor, t)!,
      warningColor: Color.lerp(warningColor, other.warningColor, t)!,
      dangerColor: Color.lerp(dangerColor, other.dangerColor, t)!,
      placeholderColor:
          Color.lerp(placeholderColor, other.placeholderColor, t)!,
    );
  }
}
