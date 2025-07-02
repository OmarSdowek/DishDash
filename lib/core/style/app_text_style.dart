import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app_2/core/style/color.dart';

class AppTextStyle {
  static TextStyle onBoardingTitleStyle = GoogleFonts.inter(
      fontSize: 32.sp, fontWeight: FontWeight.w700, color: AppColors.Kwhite);
  static TextStyle onBoardingDescriptionStyle = GoogleFonts.inter(
      fontSize: 13.sp, fontWeight: FontWeight.normal, color: AppColors.Kwhite);

  static TextStyle grey14regular = GoogleFonts.inter(
      fontSize: 14.sp, fontWeight: FontWeight.normal, color: Colors.grey);
  static TextStyle black24regular = GoogleFonts.inter(
      fontSize: 24.sp, fontWeight: FontWeight.w400, color: Colors.black);
  static TextStyle black16regular = GoogleFonts.inter(
      fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black);
  static TextStyle black12regular = GoogleFonts.inter(
      fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black);
}
