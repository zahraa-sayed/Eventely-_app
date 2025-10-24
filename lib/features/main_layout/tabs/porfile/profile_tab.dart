import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/routes_manager/routes_manager.dart';
import 'package:evently_app/features/main_layout/tabs/porfile/drop_down_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../models/user_model.dart';
import '../../../../providers/language_provider.dart';
import '../../../../providers/theme_provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsManager.blue,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(46.r)),
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(ImageAssets.routeProfile),
                SizedBox(width: 16.w),
                Padding(
                  padding: REdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        UserModel.currentUser!.name,
                        style: GoogleFonts.inter(
                          color: ColorsManager.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        UserModel.currentUser!.email,
                        style: GoogleFonts.inter(
                          color: ColorsManager.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 24.h),
        DropDownItem(
          onChanged: (newTheme){
            themeProvider.changeAppTheme(newTheme == appLocalizations.light ? ThemeMode.light : ThemeMode.dark);
          },
          label: appLocalizations.theme,
          menuItems: [appLocalizations.light, appLocalizations.dark],
          selectedItem: themeProvider.isDark ? appLocalizations.dark : appLocalizations.light,
        ),
        SizedBox(height: 16.h),
        DropDownItem(
          onChanged: (newLang){
            languageProvider.changeAppLang(newLang == appLocalizations.english ? "en" : "ar");
          },
          label: appLocalizations.language,
          menuItems: [appLocalizations.english, appLocalizations.arabic],
          selectedItem:languageProvider.isEnglish ? "English" : appLocalizations.arabic,
        ),
        Spacer(flex: 6,),
        Container(
          margin: REdgeInsets.symmetric(horizontal: 16, vertical: 110),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.red,
              foregroundColor: ColorsManager.white,
              padding: EdgeInsets.all(16.0),
              textStyle: GoogleFonts.inter(
                color: ColorsManager.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              )
            ),
            onPressed: _logout,
            child: Row(
              children: [
                Icon(Icons.logout),
                SizedBox(width: 8.w,),
                Text(appLocalizations.logout),
              ],
            ),
          ),
        ),
        //Spacer(flex: 4,)
      ],
    );
  }

  void _logout() {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, RoutesManager.login);
  }
}
