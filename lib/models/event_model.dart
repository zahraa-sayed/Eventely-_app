import 'package:evently_app/models/category_models.dart';
import 'package:flutter/material.dart';

class EventModel {
  CategoryModels category;
  String title;
  String description;
  DateTime dateTime;
  TimeOfDay timeOfDay;

  EventModel({
    required this.timeOfDay,
    required this.dateTime,
    required this.category,
    required this.title,
    required this.description,
  });
}
