import 'package:account/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// FontWeight.w100 (Thin)
// FontWeight.w200 (ExtraLight)
// FontWeight.w300 (Light)
// FontWeight.w400 (Regular / Normal)
// FontWeight.w500 (Medium)
// FontWeight.w600 (SemiBold)
// FontWeight.w700 (Bold)
// FontWeight.w800 (ExtraBold)
// FontWeight.w900 (Black)
class AppStyle {
  AppStyle._();

  static TextStyle headerTitle = GoogleFonts.nunito(
      fontWeight: FontWeight.w700,
      fontSize: 30.0,
      height: 45.0,
      color: AppColor.c_000000);
  static TextStyle inputText = GoogleFonts.nunito(
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
    color: AppColor.c_939291,
  );
  static TextStyle selectDepartment = GoogleFonts.nunito(
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
    color: AppColor.c_2F80ED,
  );
  static TextStyle doctorName = GoogleFonts.nunito(
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
    color: AppColor.c_323F4B,
  );
  static TextStyle tableHeader = GoogleFonts.nunito(
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
    color: AppColor.c_323F4B,
  );
  static TextStyle tableRow = GoogleFonts.nunito(
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    color: AppColor.c_47535D,
  );
  static TextStyle sectionRightHeader = GoogleFonts.nunito(
    fontWeight: FontWeight.w700,
    fontSize: 20.0,
    color: AppColor.c_47535D,
  );
  static TextStyle labelInputSection = GoogleFonts.nunito(
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
    color: AppColor.c_323F4B,
  );
  static TextStyle tabTitle = GoogleFonts.nunito(
    fontWeight: FontWeight.w400,
    fontSize: 20.0,
    color: AppColor.c_000000.withOpacity(0.8),
  );
}
