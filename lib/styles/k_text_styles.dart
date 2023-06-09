import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walkmate/styles/k_colors.dart';

class KTextStyle {
  static TextStyle headline1white = TextStyle(
    color:KColor.white, 
    fontSize: 35,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
  static TextStyle headline1Lite = TextStyle(
        color:KColor.baseBlack,

    fontSize: 35,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
  static TextStyle headline1Dark = TextStyle(
    color:Colors.white,
    fontSize: 35,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
   static TextStyle headline1Black = TextStyle(
    color:KColor.baseBlack,
    fontSize: 35,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle headline2White = TextStyle(
    color:Colors.white, 
    fontSize: 25,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
  static TextStyle headline2Black = TextStyle(
    color:KColor.baseBlack, 
    fontSize: 25,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle headline3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle headline4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
  static TextStyle headline5Lite = TextStyle(
    color:KColor.baseBlack, 
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
  static TextStyle headline5Dark = TextStyle(
    color:Colors.white, 
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle headline6White = TextStyle(
    color:KColor.white , 
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
  static TextStyle headline6Black = TextStyle(
    color:KColor.baseBlack, 
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
  static TextStyle headline7 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle subtitle1White = TextStyle(
    color:KColor.white,  
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
    static TextStyle subtitle1Black = TextStyle(
    color:KColor.baseBlack,  
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
    static TextStyle subtitle1LightMode = TextStyle(
    color:Colors.white,  
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
      static TextStyle subtitle1DarkMode = TextStyle(
    color:Colors.white,  
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle subtitle7Light = TextStyle(
    color:KColor.black, 
    height: 2,
    fontSize: 16,
    letterSpacing: 3,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
   static TextStyle subtitle7Dark = TextStyle(
     color:KColor.white, 
    height: 2,
    fontSize: 16,
     letterSpacing: 3,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle dialog = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle description = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle subtitle2 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle button = TextStyle(
    
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.04,
    height: 1.45,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle bodyText1Green = TextStyle(
    color:KColor.stickerColor, 
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle bodyText3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle about = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 2,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle sticker = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle caption1 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle caption2 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
}

class KAppbarText {
  Color color;
  KAppbarText({this.color = Colors.white});
  TextStyle get KApparTextStyle => TextStyle(
        color: color,
        fontSize: 31,
        fontWeight: FontWeight.w700,
        fontFamily: GoogleFonts.inter().fontFamily,
      );
}
