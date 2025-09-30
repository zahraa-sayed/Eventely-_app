import 'package:evently_app/core/assets_manager/assets_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/features/main_layout/tabs/porfile/drop_down_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "User Name",
                        style: GoogleFonts.inter(
                          color: ColorsManager.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "user_name.route@gmail.com",
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
          label: "Theme",
          menuItems: ["Light", "Dark"],
          selectedItem: "Light",
        ),
        SizedBox(height: 16.h),
        DropDownItem(
          label: "Language",
          menuItems: ["English", "عربي"],
          selectedItem: "English",
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
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.logout),
                SizedBox(width: 8.w,),
                Text("Logout"),
              ],
            ),
          ),
        ),
        //Spacer(flex: 4,)
      ],
    );
  }
}
