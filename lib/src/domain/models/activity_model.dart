// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chuva_prototipo/src/domain/models/category_model.dart';
import 'package:chuva_prototipo/src/domain/models/people_model.dart';

class ActivityEntity {
  final int id;
  final int changed;
  final String start;
  final String end;
  final String title;
  final String? description;
  final CategoryModel category;
  final String type;
  final PeopleModel? peopleModel;

  ActivityEntity({
    required this.id,
    required this.changed,
    required this.start,
    required this.end,
    required this.title,
    this.description,
    required this.category,
    required this.type,
    required this.peopleModel,
  });

  ActivityEntity copyWith({
    int? id,
    int? changed,
    String? start,
    String? end,
    String? title,
    String? description,
    CategoryModel? category,
    String? type,
    PeopleModel? peopleModel,
  }) {
    return ActivityEntity(
      id: id ?? this.id,
      changed: changed ?? this.changed,
      start: start ?? this.start,
      end: end ?? this.end,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      type: type ?? this.type,
      peopleModel: peopleModel ?? this.peopleModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'changed': changed,
      'start': start,
      'end': end,
      'title': title,
      'description': description,
      'category': category.toMap(),
      'type': type,
      'peopleModel': peopleModel?.toMap(),
    };
  }

  factory ActivityEntity.fromMap(Map<String, dynamic> map) {
    return ActivityEntity(
      id: map['id'] as int,
      changed: map['changed'] as int,
      start: map['start'] as String,
      end: map['end'] as String,
      title: map['title']['pt-br'] as String,
      description: map['description']['pt-br'] != null
          ? map['description']['pt-br'] as String
          : null,
      category: CategoryModel.fromMap(map['category'] as Map<String, dynamic>),
      type: map['type']['title']['pt-br'] as String,
      peopleModel: map['peopleModel'] != null
          ? PeopleModel.fromMap(map['peopleModel'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityEntity.fromJson(String source) =>
      ActivityEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ActivityEntity(id: $id, changed: $changed, start: $start, end: $end, title: $title, description: $description, category: $category, type: $type, peopleModel: $peopleModel)';
  }

  @override
  bool operator ==(covariant ActivityEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.changed == changed &&
        other.start == start &&
        other.end == end &&
        other.title == title &&
        other.description == description &&
        other.category == category &&
        other.type == type &&
        other.peopleModel == peopleModel;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        changed.hashCode ^
        start.hashCode ^
        end.hashCode ^
        title.hashCode ^
        description.hashCode ^
        category.hashCode ^
        type.hashCode ^
        peopleModel.hashCode;
  }
}
