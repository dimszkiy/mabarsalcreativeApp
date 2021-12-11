import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: avoid_classes_with_only_static_members
class FlutterFlowTheme {
  static const Color primaryColor = Color(0xFFEE8B60);
  static const Color secondaryColor = Color(0xFF39D2C0);
  static const Color tertiaryColor = Color(0xFFFFFFFF);

  static const Color grayIcon = Color(0xFF57636C);
  static const Color darkText = Color(0xFF0C141D);
  static const Color primary600 = Color(0xFFC3724C);
  static const Color secondary600 = Color(0xFF2CAE9F);
  static const Color dark400 = Color(0xFF262D34);
  static const Color background = Color(0xFFF1F4F8);
  static const Color grayIcon400 = Color(0xFFABB3BA);
  static const Color lineColor = Color(0xFFDBE2E7);
  static const Color dark500 = Color(0xFF1D2429);

  String primaryFontFamily = 'Poppins';
  String secondaryFontFamily = 'Roboto';
  static TextStyle get title1 => GoogleFonts.getFont(
        'Lexend Deca',
        color: Color(0xFF0C141D),
        fontWeight: FontWeight.w600,
        fontSize: 32,
      );
  static TextStyle get title2 => GoogleFonts.getFont(
        'Lexend Deca',
        color: darkText,
        fontWeight: FontWeight.w500,
        fontSize: 26,
      );
  static TextStyle get title3 => GoogleFonts.getFont(
        'Lexend Deca',
        color: darkText,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      );
  static TextStyle get subtitle1 => GoogleFonts.getFont(
        'Lexend Deca',
        color: darkText,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );
  static TextStyle get subtitle2 => GoogleFonts.getFont(
        'Lexend Deca',
        color: darkText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  static TextStyle get bodyText1 => GoogleFonts.getFont(
        'Lexend Deca',
        color: darkText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  static TextStyle get bodyText2 => GoogleFonts.getFont(
        'Lexend Deca',
        color: grayIcon,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
            );
}
