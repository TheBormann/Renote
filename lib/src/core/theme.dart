import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppTheme {
  // TODO: Copy ThemeData() from source and modify it here

  AppTheme._();

  static final Color _error = Colors.redAccent.shade200;

  static const Color _lightBrand = Colors.teal;
  static const Color _lightBlack100 = Colors.black87;
  static const Color _lightBlack80 = Colors.white10;
  static const Color _lightBlack60 = Colors.white38;
  static const Color _lightWhite80 = Colors.white70;
  static const Color _lightWhite100 = Colors.white;

  static const Color _blackBrand = Colors.amber;
  static const Color _blackWhite100 = Colors.white;
  static const Color _blackWhite80 = Colors.white10;
  static const Color _blackWhite60 = Colors.black12;
  static const Color _blackBlack80 = Colors.black45;
  static const Color _blackBlack100 = Colors.black87;

  static final ThemeData light = ThemeData(
    primarySwatch: Colors.teal,
    brightness: Brightness.light,
    fontFamily: 'Inter',

    appBarTheme: const AppBarTheme(
      titleSpacing: 0.0,
      backgroundColor: Colors.transparent,
      foregroundColor: _lightBlack100,
      elevation: 0,
      titleTextStyle: _lightHeadline5TextStyle,

      systemOverlayStyle:  SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: null,
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),

      iconTheme: IconThemeData(
          color: _lightBlack100
      ),
    ),
    textTheme: _lightTextTheme,

  );

  static final ThemeData dark = ThemeData(
    primarySwatch: Colors.amber,
    primaryColor: Colors.amber,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.amber),
    brightness: Brightness.dark,
    fontFamily: 'Inter',

    appBarTheme: AppBarTheme(
      titleSpacing: 0.0,
      backgroundColor: Colors.transparent,
      foregroundColor: _blackWhite100,
      elevation: 0,
      titleTextStyle: _darkHeadline5TextStyle,

      systemOverlayStyle: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: null,
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      iconTheme: const IconThemeData(
          color: _blackWhite100
      ),
    ),
    textTheme: _darkTextTheme,

  );

  static const TextTheme _lightTextTheme = TextTheme(
    headline1: _lightHeadline1TextStyle,
    headline2: _lightHeadline2TextStyle,
    headline3: _lightHeadline3TextStyle,
    headline4: _lightHeadline4TextStyle,
    headline5: _lightHeadline5TextStyle,
    headline6: _lightHeadline6TextStyle,

    subtitle1: _lightSubtitle1TextStyle,
    subtitle2: _lightSubtitle2TextStyle,


    bodyText1: _lightBodyText1TextStyle,
    bodyText2: _lightBodyText2TextStyle,

    caption: _lightCaptionTextStyle,
    button: _lightButtonTextStyle,
    overline: _lightOverlineText2TextStyle,
  );
  static final TextTheme _darkTextTheme = TextTheme(
    headline1: _darkHeadline1TextStyle,
    headline2: _darkHeadline2TextStyle,
    headline3: _darkHeadline3TextStyle,
    headline4: _darkHeadline4TextStyle,
    headline5: _darkHeadline5TextStyle,
    headline6: _darkHeadline6TextStyle,

    subtitle1: _darkSubtitle1TextStyle,
    subtitle2: _darkSubtitle2TextStyle,


    bodyText1: _darkBodyText1TextStyle,
    bodyText2: _darkBodyText2TextStyle,

    caption: _darkCaptionTextStyle,
    button: _darkButtonTextStyle,
    overline: _darkOverlineText2TextStyle,
  );

  static const TextStyle _lightHeadline1TextStyle = TextStyle(
      fontSize: 93,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
      color: _lightBlack100
  );
  static const TextStyle _lightHeadline2TextStyle = TextStyle(
      fontSize: 58,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
      color: _lightBlack100
  );
  static const TextStyle _lightHeadline3TextStyle = TextStyle(
      fontSize: 47,
      fontWeight: FontWeight.w400,
      color: _lightBlack100,
  );
  static const TextStyle _lightHeadline4TextStyle = TextStyle(
      fontSize: 33,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: _lightBlack100,
  );
  static const TextStyle _lightHeadline5TextStyle = TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.w400,
      color: _lightBlack100,
  );
  static const TextStyle _lightHeadline6TextStyle = TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: _lightBlack100
  );

  static const TextStyle _lightSubtitle1TextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: _lightBlack100,
  );
  static const TextStyle _lightSubtitle2TextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: _lightBlack100,
  );

  static const TextStyle _lightBodyText1TextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: _lightBlack100,
  );
  static const TextStyle _lightBodyText2TextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: _lightBlack100,
  );

  static const TextStyle _lightCaptionTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      color: _lightBlack100,
  );
  static const TextStyle _lightButtonTextStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: _lightBlack100,
  );
  static const TextStyle _lightOverlineText2TextStyle = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
      color: _lightBlack100,
  );

  static final TextStyle _darkHeadline1TextStyle = _lightHeadline1TextStyle
      .copyWith(color: _blackWhite100);
  static final TextStyle _darkHeadline2TextStyle = _lightHeadline2TextStyle
      .copyWith(color: _blackWhite100);
  static final TextStyle _darkHeadline3TextStyle = _lightHeadline3TextStyle
      .copyWith(color: _blackWhite100);
  static final TextStyle _darkHeadline4TextStyle = _lightHeadline4TextStyle
      .copyWith(color: _blackWhite100);
  static final TextStyle _darkHeadline5TextStyle = _lightHeadline5TextStyle
      .copyWith(color: _blackWhite100);
  static final TextStyle _darkHeadline6TextStyle = _lightHeadline6TextStyle
      .copyWith(color: _blackWhite100);

  static final TextStyle _darkSubtitle1TextStyle = _lightSubtitle1TextStyle
      .copyWith(color: _blackWhite100);
  static final TextStyle _darkSubtitle2TextStyle = _lightSubtitle2TextStyle
      .copyWith(color: _blackWhite100);

  static final TextStyle _darkBodyText1TextStyle = _lightBodyText1TextStyle
      .copyWith(color: _blackWhite100);
  static final TextStyle _darkBodyText2TextStyle = _lightBodyText2TextStyle
      .copyWith(color: _blackWhite100);

  static final TextStyle _darkCaptionTextStyle = _lightCaptionTextStyle
      .copyWith(color: _blackWhite100);
  static final TextStyle _darkButtonTextStyle = _lightButtonTextStyle
      .copyWith(color: _blackWhite100);
  static final TextStyle _darkOverlineText2TextStyle = _lightOverlineText2TextStyle
      .copyWith(color: _blackWhite100);
}