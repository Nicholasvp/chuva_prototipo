// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PeopleModel {
  final String id;
  final String title;
  final String name;
  final String institution;
  final String bio;
  final String picture;
  PeopleModel({
    required this.id,
    required this.title,
    required this.name,
    required this.institution,
    required this.bio,
    required this.picture,
  });

  PeopleModel copyWith({
    String? id,
    String? title,
    String? name,
    String? institution,
    String? bio,
    String? picture,
  }) {
    return PeopleModel(
      id: id ?? this.id,
      title: title ?? this.title,
      name: name ?? this.name,
      institution: institution ?? this.institution,
      bio: bio ?? this.bio,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'name': name,
      'institution': institution,
      'bio': bio,
      'picture': picture,
    };
  }

  factory PeopleModel.fromMap(Map<String, dynamic> map) {
    return PeopleModel(
      id: map['id'] as String,
      title: map['title'] as String,
      name: map['name'] as String,
      institution: map['institution'] as String,
      bio: map['bio'] as String,
      picture: map['picture'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PeopleModel.fromJson(String source) =>
      PeopleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PeopleModel(id: $id, title: $title, name: $name, institution: $institution, bio: $bio, picture: $picture)';
  }

  @override
  bool operator ==(covariant PeopleModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.name == name &&
        other.institution == institution &&
        other.bio == bio &&
        other.picture == picture;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        name.hashCode ^
        institution.hashCode ^
        bio.hashCode ^
        picture.hashCode;
  }
}
