import 'package:chuva_prototipo/src/domain/models/activity_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityController extends ChangeNotifier {
  bool favorited = false;
  bool isLoading = false;

  String getStart(ActivityEntity activityEntity) {
    DateTime startAt = DateTime.parse(activityEntity.start);
    DateTime endAt = DateTime.parse(activityEntity.end);
    String fomartDate = DateFormat('EEEE').format(startAt);
    return '$fomartDate ${DateFormat('HH:mm').format(startAt)}h - ${DateFormat('HH:mm').format(endAt)}h';
  }
}
