import 'package:ait_design_generator_annotation/ait_design_generator_annotation.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

part 'design_theme_extended.theme.dart';

@ThemeColor()
abstract class DesignThemeExtended extends DesignTheme
    with _DesignThemeExtended$Mixin {
  const DesignThemeExtended();
  @ThemeDefault('FFFFFF', '000000')
  @override
  Color get primaryBase;

  static DesignThemeExtended of(BuildContext context) =>
      Theme.of(context).extension<DesignTheme>()! as DesignThemeExtended;

  const factory DesignThemeExtended.light() = _DesignThemeExtendedLight;
  const factory DesignThemeExtended.dark() = _DesignThemeExtendedDark;

  static ThemeData lightTheme(
      {String? fontFamily, List<ThemeExtension> extension = const []}) {
    const theme = DesignTheme.light();
    return ThemeData(
      textTheme: DesignTextStyle.theme.apply(
          fontFamily: fontFamily,
          bodyColor: theme.neutral90,
          displayColor: theme.neutral90,
          decorationColor: theme.neutral90),
      brightness: Brightness.light,
      extensions: <ThemeExtension<dynamic>>[theme, ...extension],
    );
  }

  static ThemeData darkTheme(
      {String? fontFamily, List<ThemeExtension> extensions = const []}) {
    const theme = DesignTheme.dark();
    return ThemeData(
      textTheme: DesignTextStyle.theme.apply(
          fontFamily: fontFamily,
          bodyColor: theme.neutral100,
          displayColor: theme.neutral100,
          decorationColor: theme.neutral100),
      brightness: Brightness.dark,
      extensions: <ThemeExtension<dynamic>>[theme, ...extensions],
    );
  }
}
