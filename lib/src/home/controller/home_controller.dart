import 'package:chuva_prototipo/src/domain/models/activity_model.dart';
import 'package:chuva_prototipo/src/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeController extends ChangeNotifier {
  //VARIABLES
  bool isLoading = false;
  List<ActivityEntity?> activities = [];

  DateTime currentDate = DateTime.parse('2023-11-29T10:00:00-03:00');
  String get month => DateFormat('MMM').format(currentDate);
  String get year => DateFormat('yyyy').format(currentDate);

  //SERVICES
  ApiService apiService = ApiService();

  //FUNCTIONS
  Future<void> fetchActivities() async {
    loading();
    activities = await apiService.fetchActivities();
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
    DateTime start = DateTime.parse(activity.start);
    DateTime end = DateTime.parse(activity.end);

    return "${activity.type} de ${DateFormat('HH:mm').format(start)} até ${DateFormat('HH:mm').format(end)}";
  }
}
