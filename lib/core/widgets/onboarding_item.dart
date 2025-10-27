import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/resources/colors_manager.dart';
import '../../core/resources/assets_manager.dart';
import '../../models/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  final OnBoardingModel model;

  const OnboardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),

            Center(
              child: Image.asset(
                ImageAssets.mineLogo,
                height: 40.h,
                color: ColorsManager.blue,
              ),
            ),

            SizedBox(height: 30.h),
            Image.asset(
              model.image,
              height: 300.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 30.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                model.title,
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.blue,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                model.description,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  color: ColorsManager.black,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
