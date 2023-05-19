import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget welcomeTextStyle(
    String text, double size, Color color) {
  return Center(
    child: Container(
      child: Center(
        child: Text(text,
            style: GoogleFonts.baloo2(
                textStyle: TextStyle(fontSize: size, color: color,))),
      ),
    ),
  );
}

Widget customText(String text, Color color, double size, bool underline) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      // fontWeight: underline ? FontWeight.bold : FontWeight.normal,
    ),
  );
}
