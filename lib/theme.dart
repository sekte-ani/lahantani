import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color blackColor = const Color(0xff404040);
Color black2Color = const Color(0xff4D4D4D);
Color greyColor = const Color(0xffC7C9D9);
Color darkGreyColor = const Color(0xffA3A3A3);
Color lightGreyColor = const Color(0xffEDEFF9);
Color bgColor = const Color(0xffF6F9FF);
Color whiteColor = const Color(0xffFFFFFF);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;

BoxShadow themeShadow = BoxShadow(
  color: darkGreyColor.withOpacity(0.2),
  blurRadius: 10.0,
  spreadRadius: 0,
);

TextStyle font_light = GoogleFonts.poppins(
  fontWeight: light,
  color: blackColor,
);
TextStyle font_regular = GoogleFonts.poppins(
  fontWeight: regular,
  color: blackColor,
);
TextStyle font_medium = GoogleFonts.poppins(
  fontWeight: medium,
  color: blackColor,
);
TextStyle font_semiBold = GoogleFonts.poppins(
  fontWeight: semiBold,
  color: blackColor,
);
TextStyle font_bold = GoogleFonts.poppins(
  fontWeight: bold,
  color: blackColor,
);
TextStyle font_extraBold = GoogleFonts.poppins(
  fontWeight: extraBold,
  color: blackColor,
);