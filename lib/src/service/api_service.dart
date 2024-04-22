import 'dart:convert';

import 'package:chuva_prototipo/src/domain/models/activity_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  final dio = Dio();

  Future<List<ActivityEntity?>> fetchActivities() async {
    try {
      final response = await dio.get(
          'https://raw.githubusercontent.com/chuva-inc/exercicios-2023/master/dart/assets/activities.json');
      if (response.statusCode == 200) {
        final decode = jsonDecode(response.data);
        List<ActivityEntity?> listActivity = (decode['data'] as List)
            .map<ActivityEntity?>(
                (e) => ActivityEntity.fromMap(e as Map<String, dynamic>))
            .toList();
        debugPrint(listActivity.toString());
        return listActivity;
      }
      return [];
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<List<ActivityEntity?>> fetchActivitiesSecondPage() async {
    try {
      final response = await dio.get(
          'https://raw.githubusercontent.com/chuva-inc/exercicios-2023/master/dart/assets/activities-1.json');
      if (response.statusCode == 200) {
        final decode = jsonDecode(response.data);
        List<ActivityEntity?> listActivity = (decode['data'] as List)
            .map<ActivityEntity?>(
                (e) => ActivityEntity.fromMap(e as Map<String, dynamic>))
            .toList();
        debugPrint(listActivity.toString());
        return listActivity;
      }
      return [];
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
