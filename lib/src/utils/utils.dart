import 'package:chuva_prototipo/src/domain/models/activity_model.dart';
import 'package:intl/intl.dart';

class Utils {
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
