import 'package:flutter/material.dart';

class CategoryModels {
  String id;
  String name;
  IconData iconData;
  String imagePath;

  CategoryModels({
    required this.id,
    required this.name,
    required this.iconData,
    required this.imagePath,
  });

  static List<CategoryModels> categoriesWithAll = [
    CategoryModels(id: "0", name: "All", iconData: Icons.all_inclusive_rounded, imagePath: ""),
    CategoryModels(id: "1", name: "Sports", iconData: Icons.sports, imagePath: ""),
    CategoryModels(id: "2", name: "Birthday", iconData: Icons.cake, imagePath: ""),
    CategoryModels(id: "3", name: "Meeting", iconData: Icons.meeting_room, imagePath: ""),
    CategoryModels(id: "4", name: "Gaming", iconData: Icons.gamepad_rounded, imagePath: ""),
    CategoryModels(id: "5", name: "Eating", iconData: Icons.local_pizza_rounded, imagePath: ""),
    CategoryModels(id: "6", name: "Holiday", iconData: Icons.holiday_village_rounded, imagePath: ""),
    CategoryModels(id: "7", name: "Exhibition", iconData: Icons.water_drop, imagePath: ""),
    CategoryModels(id: "8", name: "WorkShop", iconData: Icons.workspaces_rounded, imagePath: ""),
    CategoryModels(id: "9", name: "BookClub", iconData: Icons.book_rounded, imagePath: ""),
  ];
}
