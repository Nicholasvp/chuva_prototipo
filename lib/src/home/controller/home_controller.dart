import 'package:chuva_prototipo/src/domain/models/activity_model.dart';
import 'package:chuva_prototipo/src/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeController extends ChangeNotifier {
  //VARIABLES
  bool isLoading = false;
  List<ActivityEntity?> activities = [];

  DateTime currentDate = DateTime.parse('2023-11-26T07:00:00-03:00');
  bool favorited = false;

  // GETTERS
  String get month => DateFormat('MMM').format(currentDate);
  String get year => DateFormat('yyyy').format(currentDate);
  String get day => DateFormat('dd').format(currentDate);
  List<ActivityEntity?> get activitiesByDay => activities.where((element) {
        DateTime start = DateTime.parse(element!.start);
        return start.day == currentDate.day;
      }).toList();

  //SETTERS
  void changeDate(DateTime date) {
    currentDate = date;
    notifyListeners();
  }

  //SERVICES
  ApiService apiService = ApiService();

  //FUNCTIONS
  Future<void> fetchActivities() async {
    loading();
    activities = await apiService.fetchActivities();
    activities.addAll(await apiService.fetchActivitiesSecondPage());
    completed();
    notifyListeners();
  }

  void loading() {
    isLoading = true;
    notifyListeners();
  }

  void completed() {
    isLoading = false;
    notifyListeners();
  }

  String getLabel(ActivityEntity activity) {
    DateTime start =
        DateTime.parse(activity.start).subtract(const Duration(hours: 3));
    DateTime end =
        DateTime.parse(activity.end).subtract(const Duration(hours: 3));

    return "${activity.type} de ${DateFormat('HH:mm').format(start)} até ${DateFormat('HH:mm').format(end)}";
  }

  String getPeople(ActivityEntity activity) {
    if (activity.listPeopleModel.isEmpty) {
      return '';
    }
    return activity.listPeopleModel.map((e) => e!.name).join(', ');
  }
}
