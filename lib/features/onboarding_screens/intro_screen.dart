import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/features/onboarding_screens/onboarding_screens.dart';
import 'package:evently_app/providers/language_provider.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/l10n/app_localizations.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Center(
                child: Image.asset(
                  ImageAssets.mineLogo,
                  color: ColorsManager.blue,
                ),
              ),
              SizedBox(height: 30),
              Center(child: Image.asset(ImageAssets.beingCreative)),
              SizedBox(height: 30),
              Text(
                languageProvider.isEnglish
                    ? "Personalize Your Experience"
                    : "خصص تجربتك",
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  color: ColorsManager.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 28.h),
              Text(
                languageProvider.isEnglish
                    ? "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style."
                    : "اختر اللغة والثيم المفضلين لديك لتبدأ بتجربة مريحة ومخصصة تناسب ذوقك.",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  color: ColorsManager.black,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    appLocalizations.language,
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      color: ColorsManager.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      languageProvider.changeAppLang(
                        languageProvider.isEnglish ? "ar" : "en",
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(30.r),
                        boxShadow: [
                          BoxShadow(
                            color: ColorsManager.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.language, color: ColorsManager.blue),
                          SizedBox(width: 6),
                          Text(
                            languageProvider.isEnglish ? "EN" : "AR",
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: ColorsManager.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    appLocalizations.theme,
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      color: ColorsManager.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      themeProvider.changeAppTheme(
                        themeProvider.isDark ? ThemeMode.light : ThemeMode.dark,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(30.r),
                        boxShadow: [
                          BoxShadow(
                            color: ColorsManager.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(8.w),
                      child: Icon(
                        themeProvider.isDark
                            ? Icons.dark_mode_rounded
                            : Icons.light_mode_rounded,
                        color: ColorsManager.blue,
                        size: 26.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnboardingScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                  ),
                  child: Text(
                    appLocalizations.lets_start,
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
