import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class FigmaColors {
  const FigmaColors();

  static const Color anarenk = Color(0xfff69829);
  static const Color ikincirenk = Color(0xff262835);
  static const Color gri = Color(0xfff8f8f8);
  static const Color beyaz = Color(0xffffffff);
  static const Color siyah = Color(0xff000000);
  static const Color koyugri = Color(0xff636363);
  static const Color kirmizi = Color(0xffeb1d0a);
  static const Color yesil = Color(0xff6add34);

}


final ThemeData tema = ThemeData(
  primaryColor: Color(0xfff69829), //Yedek eklendi
  colorScheme: const ColorScheme(
      primary: Color(0xfff69829), //Düzenlendi
      secondary: Color(0xff262835), //Düzenlendi
      surface: Color(0xffffffff),
      background: Color(0xfff8f8f8),
      error: Color(0xffeb1d0a), //Düzenlendi
      onPrimary: Color(0xffffffff),
      onSecondary: Color(0xffffffff), //Düzenlendi
      onSurface: Color(0xffffffff),
      onBackground: Color(0xfff8f8f8),
      onError: Color(0xffffffff),
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Color(0xfff8f8f8), //Arkaplan rengi
  
    textTheme: TextTheme(
          //HO
          displayLarge: GoogleFonts.poppins(
          fontSize: 93,
          fontWeight: FontWeight.w400,
          letterSpacing: -1.5,
          color: Color(0xff262835),
          ),

          //H1
          displayMedium: GoogleFonts.poppins(
            fontSize: 48.8,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.4,
            color: Color(0xff262835),
          ),

          //H2
          displaySmall: GoogleFonts.poppins(
            fontSize: 39.1,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.4,
            color: Color(0xff262835),
          ),

          //H3
          headlineMedium: GoogleFonts.poppins(
            fontSize: 31.3,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.4,
            color: Color(0xff262835),
          ),

          //H4
          headlineSmall: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.4,
            color: Color(0xff262835),
          ),

          //H5
          titleLarge: GoogleFonts.poppins(
            fontSize: 19,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.4,
            color: Color(0xff262835),
          ),
          //Paragraph
          titleMedium: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.4,
            color: Color(0xff262835),
          ),
          titleSmall: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.1
          ),
          bodyLarge: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25
          ),
          bodySmall: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4
          ),

          //Small
          labelLarge: GoogleFonts.poppins(
            fontSize: 12.8,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.4,
            color: Color(0xff262835),
          ),
          //XSmall
          labelSmall: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.4,
            color: Color(0xff262835),
          ),
    ),
  
    iconTheme: const IconThemeData(
        color: Color(0xfff69829),
    ),
);


extension TemaType on BuildContext {

  // * Text Tema Context 
  TextStyle? get h1 => Theme.of(this).textTheme.displayMedium;
  TextStyle? get h2 => Theme.of(this).textTheme.displaySmall;
  TextStyle? get h3 => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get h4 => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get h5 => Theme.of(this).textTheme.titleLarge;
  TextStyle? get paragraph => Theme.of(this).textTheme.titleSmall;
  TextStyle? get small => Theme.of(this).textTheme.labelLarge;
  TextStyle? get xsmall => Theme.of(this).textTheme.labelLarge;
  Color? get primary => Theme.of(this).colorScheme.primary;
  Color? get secondary => Theme.of(this).colorScheme.secondary;

}
