import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.whiteBlue,
      foregroundColor: ColorsManager.blue,
      centerTitle: true,
      titleTextStyle: GoogleFonts.roboto(
        color: ColorsManager.blue,
        fontSize: 22.sp,
        fontWeight: FontWeight.w400,
      ),
    ),
    scaffoldBackgroundColor: ColorsManager.whiteBlue,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.blue,
      foregroundColor: ColorsManager.white,
      shape: StadiumBorder(
        side: BorderSide(color: ColorsManager.white, width: 4.w),
      )
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: ColorsManager.blue,
      shape: CircularNotchedRectangle(),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManager.white,
      unselectedItemColor: ColorsManager.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.grey, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      labelStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        color: ColorsManager.grey,
        fontWeight: FontWeight.w500,
      ),
      prefixIconColor: ColorsManager.grey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: REdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: ColorsManager.blue,
        foregroundColor: ColorsManager.white,
        textStyle: GoogleFonts.inter(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.white,
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: GoogleFonts.inter(
        color: ColorsManager.blue,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.inter(
        color: ColorsManager.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.black,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.blue,
      ),
    ),
  );
  static final ThemeData dark = ThemeData();
}

