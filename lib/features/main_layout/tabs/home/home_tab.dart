import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/custom_tabBar.dart';
import 'package:evently_app/features/main_layout/tabs/home/event_item.dart';
import 'package:evently_app/models/category_models.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/tab_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: REdgeInsets.only(top: 40, bottom: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(14.r)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back ✨",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          "User Name",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: ColorsManager.ofWhite,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "Cairo , Egypt",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.light_mode, color: ColorsManager.white),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        color: ColorsManager.ofWhite,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "En",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              DefaultTabController(
                length: CategoryModels.categoriesWithAll.length,
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  tabs: CategoryModels.categoriesWithAll
                      .map(
                        (category) => TabItem(
                      selectedTabBgColor: ColorsManager.whiteBlue,
                      selectedTabFgColor: ColorsManager.blue,
                      unSelectedTabBgColor: Colors.transparent,
                      unSelectedTabFgColor: ColorsManager.whiteBlue,
                      isSelected: selectedIndex == CategoryModels.categoriesWithAll.indexOf(category),
                      category: category,
                    ),
                  )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => EventItem(
              event: EventModel(
                timeOfDay: TimeOfDay.now(),
                dateTime: DateTime.now(),
                category: CategoryModels.categoriesWithAll[3],
                title: "Meeting for Updating The Development Method",
                description: "Meeting for Updating The Development Method",
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
