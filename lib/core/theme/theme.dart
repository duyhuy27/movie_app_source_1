import 'package:flutter/material.dart';
import 'package:huynd2_assignment/core/theme/button_theme/elevated_button_theme.dart';
import 'package:huynd2_assignment/core/theme/text_theme/text_theme.dart';
import 'package:huynd2_assignment/manager/color.dart';

class TAppTheme {
  final ThemeData themeData;

  const TAppTheme({required this.themeData});

  static final TAppTheme lightTheme = TAppTheme(
    themeData: ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: TAppColor.primaryColor,
      scaffoldBackgroundColor: TAppColor.whiteLightColor,
      textTheme: TTextTheme.lightTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.elevatedButtonThemeLight,
      
    ),
  );

  static final TAppTheme darkTheme = TAppTheme(
    themeData: ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: TAppColor.primaryColor,
      scaffoldBackgroundColor: TAppColor.darkBlueColor,
      textTheme: TTextTheme.darkTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.elevatedButtonThemeDark,
    ),
  );
}
