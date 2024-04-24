import 'package:chuva_prototipo/src/domain/models/activity_model.dart';
import 'package:chuva_prototipo/src/domain/models/people_model.dart';
import 'package:chuva_prototipo/src/home/controller/activity_controller.dart';
import 'package:chuva_prototipo/src/home/controller/home_controller.dart';
import 'package:flutter/material.dart';

class PeopleController extends ChangeNotifier {
  ActivityController activityController = ActivityController();
  HomeController homeController = HomeController();

  List<ActivityEntity?> get activities => homeController.activities;
  List<ActivityEntity?> filterActivities = [];

  String extractContent(String? content) {
    return activityController.extractContent(content ?? '') ?? '';
  }

  Future<void> fetchActivities() async {
    await homeController.fetchActivities();
    notifyListeners();
  }

  Future<void> filterActivitiesByPeople(PeopleModel peopleModel) async {
    await fetchActivities();

    for (ActivityEntity? activity in activities) {
      if (activity?.listPeopleModel.contains(peopleModel) ?? false) {
        if (!filterActivities.contains(activity)) {
          filterActivities.add(activity);
        }
      }
    }
  }
}
