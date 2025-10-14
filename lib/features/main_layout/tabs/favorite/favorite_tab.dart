import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/features/main_layout/tabs/home/event_item.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../models/category_models.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: REdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: ColorsManager.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: ColorsManager.blue),
                ),
                prefixIcon: Icon(Icons.search, color: ColorsManager.blue),
                hintText: appLocalizations.search_for_event,
                hintStyle: GoogleFonts.inter(
                  color: ColorsManager.blue,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h,),
          Expanded(child: ListView.separated(
              itemBuilder: (context, index)=>EventItem(event: EventModel(
                timeOfDay: TimeOfDay.now(),
                dateTime: DateTime.now(),
                category: CategoryModels.getCategoriesWithAll(context)[3],
                title: "Meeting for Updating The Development Method",
                description: "Meeting for Updating The Development Method",
              ),),
              separatorBuilder: (context, index)=>SizedBox(height: 16.h,),
              itemCount: 20,
          )
          ),
        ],
      ),
    );
  }
}
