import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'tab_item.dart';
import '../../models/category_models.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.selectedBgColor,
    required this.selectedFgColor,
    required this.unSelectedBgColor,
    required this.unSelectedFgColor,
    required this.categories,
  });

  final Color selectedBgColor;
  final Color unSelectedBgColor;
  final Color selectedFgColor;
  final Color unSelectedFgColor;
  final List<CategoryModels> categories;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        padding: REdgeInsets.symmetric(vertical: 16),
        labelPadding: EdgeInsets.symmetric(horizontal: 12.w),
        isScrollable: true,
        indicator: BoxDecoration(),
        tabs: List.generate(widget.categories.length, (index) {
          final category = widget.categories[index];
          return TabItem(
            selectedTabBgColor: widget.selectedBgColor,
            selectedTabFgColor: widget.selectedFgColor,
            unSelectedTabBgColor: widget.unSelectedBgColor,
            unSelectedTabFgColor: widget.unSelectedFgColor,
            category: category,
            isSelected: selectedIndex == index,
          );
        }),
      ),
    );
  }
}
