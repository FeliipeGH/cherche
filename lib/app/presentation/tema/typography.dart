import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';


class MainTypography {
  static TextStyle tittleApp = GoogleFonts.amiko(
      textStyle: TextStyle(
          letterSpacing: 1.5,
          fontWeight: FontWeight.bold));

  static TextStyle headlineTextStyle = GoogleFonts.montserrat(
      textStyle: TextStyle(
          letterSpacing: 1.5,
          fontWeight: FontWeight.w500));

  static TextStyle headlineSecondaryTextStyle = GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontWeight: FontWeight.w300));

  static TextStyle subtitleTextStyle = GoogleFonts.openSans(
      textStyle: TextStyle(letterSpacing: 1));

  static TextStyle bodyTextStyle =
      GoogleFonts.openSans(textStyle: TextStyle());

  static TextStyle buttonTextStyle = GoogleFonts.montserrat(
      textStyle: TextStyle( letterSpacing: 1));

  static TextStyle menuListTileDefaultText =
      TextStyle(color: Colors.white70, fontWeight: FontWeight.bold);
  static TextStyle menuListTileSelectedText =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  static TextStyle cardTileSubText =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.normal);
  static TextStyle cardTileTitleText =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.normal);
  static TextStyle cardTileMainText =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
  static TextStyle cardTitleTextStyle = TextStyle(color: Colors.black87);
}
