import 'package:flutter/material.dart';

const horizontalButtonSpacing = SizedBox(width: 12);
const verticalButtonSpacing = SizedBox(height: 12);

const horizontalButtonSpacingLarge = SizedBox(width: 36);
const verticalButtonSpacingLarge = SizedBox(height: 36);

const subtitleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
const appFallbackFontFamily = <String>['Inter', 'DengXian', 'sans-serif'];

DefaultTextStyle defaultTextStyle({required Widget child}) {
  return DefaultTextStyle(
      style: const TextStyle(
        fontFamily: 'Inter',
        fontFamilyFallback: appFallbackFontFamily,
        fontWeight: FontWeight.w900,
      ),
      child: child);
}

extension TextThemeX on TextTheme {
  TextTheme applyForEach(TextStyle? Function(TextStyle?) apply) {
    return TextTheme(
      headline1: apply(headline1),
      headline2: apply(headline2),
      headline3: apply(headline3),
      headline4: apply(headline4),
      headline5: apply(headline5),
      headline6: apply(headline6),
      subtitle1: apply(subtitle1),
      subtitle2: apply(subtitle2),
      bodyText1: apply(bodyText1),
      bodyText2: apply(bodyText2),
      caption: apply(caption),
      button: apply(button),
      overline: apply(overline),
    );
  }
}



// const largeTextStyle = 