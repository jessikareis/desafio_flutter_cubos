import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  static final TextStyle h1 = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.grey1,
  );

  static final TextStyle searchStyle = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.grey2,
  );

  static final TextStyle buttonStyle = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.green1,
  );
}
