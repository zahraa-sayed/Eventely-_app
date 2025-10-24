import 'package:evently_app/models/category_models.dart';
import 'package:flutter/material.dart';

class EventModel {
  CategoryModels category;
  String eventId;
  String userId;
  String title;
  String description;
  DateTime dateTime;

  EventModel({
    required this.eventId,
    required this.userId,
    required this.dateTime,
    required this.category,
    required this.title,
    required this.description,
  });

  EventModel.fromJson(Map<String, dynamic> json, BuildContext context)
    : this(
        eventId: json["eventId"],
        userId: json["userId"],
        category: CategoryModels.getCategories(
          context,
        ).firstWhere((category) => category.id == json["categoryId"]),
        title: json["title"],
        description: json["description"],
        dateTime: json["dateTime"].toDate(),
      );

  Map<String, dynamic> toJson() => {
    "eventId": eventId,
    "userId": userId,
    "categoryId": category.id,
    "title": title,
    "description": description,
    "dateTime": dateTime,
  };
}
