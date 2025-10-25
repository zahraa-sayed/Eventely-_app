import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

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

  static List<CategoryModels> getCategoriesWithAll(BuildContext context){
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return [
      CategoryModels(id: "0", name: appLocalizations.all, iconData: Icons.all_inclusive_rounded, imagePath: ""),
      CategoryModels(id: "1", name: appLocalizations.sport, iconData: Icons.sports, imagePath: ""),
      CategoryModels(id: "2", name: appLocalizations.birthday, iconData: Icons.cake, imagePath: ""),
      CategoryModels(id: "3", name: appLocalizations.meeting, iconData: Icons.meeting_room, imagePath: ""),
      CategoryModels(id: "4", name: appLocalizations.gaming, iconData: Icons.gamepad_rounded, imagePath: ""),
      CategoryModels(id: "5", name: appLocalizations.eating, iconData: Icons.local_pizza_rounded, imagePath: ""),
      CategoryModels(id: "6", name: appLocalizations.holiday, iconData: Icons.holiday_village_rounded, imagePath: ""),
      CategoryModels(id: "7", name: appLocalizations.exhibition, iconData: Icons.water_drop, imagePath: ""),
      CategoryModels(id: "8", name: appLocalizations.workshop, iconData: Icons.workspaces_rounded, imagePath: ""),
      CategoryModels(id: "9", name: appLocalizations.book_club, iconData: Icons.book_rounded, imagePath: ""),
    ];
  }

  static List<CategoryModels> getCategories(BuildContext context){
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return [
      CategoryModels(id: "1", name: appLocalizations.sport, iconData: Icons.sports, imagePath: ImageAssets.sport),
      CategoryModels(id: "2", name: appLocalizations.birthday, iconData: Icons.cake, imagePath: ImageAssets.birthday),
      CategoryModels(id: "3", name: appLocalizations.meeting, iconData: Icons.meeting_room, imagePath: ImageAssets.meetingCover),
      CategoryModels(id: "4", name: appLocalizations.gaming, iconData: Icons.gamepad_rounded, imagePath: ImageAssets.gaming),
      CategoryModels(id: "5", name: appLocalizations.eating, iconData: Icons.local_pizza_rounded, imagePath: ImageAssets.eating),
      CategoryModels(id: "6", name: appLocalizations.holiday, iconData: Icons.holiday_village_rounded, imagePath: ImageAssets.holiday),
      CategoryModels(id: "7", name: appLocalizations.exhibition, iconData: Icons.water_drop, imagePath: ImageAssets.exhibition),
      CategoryModels(id: "8", name: appLocalizations.workshop, iconData: Icons.workspaces_rounded, imagePath: ImageAssets.workShop),
      CategoryModels(id: "9", name: appLocalizations.book_club, iconData: Icons.book_rounded, imagePath: ImageAssets.bookClub),
    ];
  }
}
