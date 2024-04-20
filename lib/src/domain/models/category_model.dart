// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryModel {
  final int id;
  final String title;
  final String? color;
  final String? background;
  CategoryModel({
    required this.id,
    required this.title,
    required this.color,
    required this.background,
  });

  CategoryModel copyWith({
    int? id,
    String? title,
    String? color,
    String? background,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      color: color ?? this.color,
      background: background ?? this.background,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'color': color,
      'background': background,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      title: map['title']['pt-br'] as String,
      color: map['color'] != null ? map['color'] as String : null,
      background:
          map['background'] != null ? map['background'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoryModel(id: $id, title: $title, color: $color, background: $background)';
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.color == color &&
        other.background == background;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ color.hashCode ^ background.hashCode;
  }
}
