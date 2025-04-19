import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles { 
  static TextStyle poppins({TextStyle? style}) {
    return GoogleFonts.poppins (
      textStyle: style,
    );
  }
}