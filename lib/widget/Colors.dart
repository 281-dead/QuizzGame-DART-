import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kprimaryColor = Color(0xFF142850);
const lightColor = Color(0xFF1D87A5);
const white = Color(0xFFFDFDFD);
const black = Colors.black54;

class CustomTextStyle {
  static TextStyle styleBoldWhite = GoogleFonts.abel(
    color: white.withOpacity(0.80),
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );
  static TextStyle styleBoldBlack = GoogleFonts.abel(
    color: black.withOpacity(0.7),
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle styleNomalWhite = GoogleFonts.abel(
    color: white.withOpacity(0.80),
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );
}
