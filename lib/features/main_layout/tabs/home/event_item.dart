import 'package:evently_app/core/assets_manager/assets_manager.dart';
import 'package:evently_app/core/extensions/date_time_ex.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EventItem extends StatelessWidget {
  EventItem({super.key, required this.event});
  final EventModel event;
  List<String> months =[
    "Jan",
    "Feb",
    "March",
    "April",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: REdgeInsets.all(8),
          margin: REdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          height: 203.h,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(ImageAssets.meetingCover)),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: ColorsManager.blue, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: REdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        event.dateTime.day.toString(),
                        style: GoogleFonts.inter(
                          color: ColorsManager.blue,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        event.dateTime.viewMonth,
                        style: GoogleFonts.inter(
                          color: ColorsManager.blue,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          event.title,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: ColorsManager.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
