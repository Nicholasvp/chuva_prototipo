import 'package:chuva_prototipo/src/domain/models/activity_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityController extends ChangeNotifier {
  bool favorited = false;
  bool isLoading = false;

  String getStart(ActivityEntity activityEntity) {
    DateTime startAt =
        DateTime.parse(activityEntity.start).subtract(const Duration(hours: 3));
    DateTime endAt =
        DateTime.parse(activityEntity.end).subtract(const Duration(hours: 3));
    String fomartDate = DateFormat('EEEE', 'pt_BR').format(startAt);
    return '$fomartDate ${DateFormat('HH:mm').format(startAt)}h - ${DateFormat('HH:mm').format(endAt)}h';
  }

  void toggleFavorite() async {
    loading();
    await Future.delayed(const Duration(seconds: 1));
    favorited = !favorited;
    completed();
  }

  void loading() {
    isLoading = true;
    notifyListeners();
  }

  void completed() {
    isLoading = false;
    notifyListeners();
  }

  String? extractContent(String htmlString) {
    RegExp regex = RegExp(r'<p>(.*?)<\/p>');
    RegExpMatch? match = regex.firstMatch(htmlString);
    if (match != null && match.groupCount >= 1) {
      return match.group(1); // Retorna o conteúdo dentro das tags <p>
    } else {
      return "";
    }
  }
}
