// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PeopleModel {
  final int id;
  final String? title;
  final String name;
  final String? institution;
  final String? bio;
  final String? picture;
  final String role;

  PeopleModel({
    required this.id,
    required this.title,
    required this.name,
    required this.institution,
    required this.bio,
    required this.picture,
    required this.role,
  });

  PeopleModel copyWith({
    int? id,
    String? title,
    String? name,
    String? institution,
    String? bio,
    String? picture,
    String? role,
  }) {
    return PeopleModel(
      id: id ?? this.id,
      title: title ?? this.title,
      name: name ?? this.name,
      institution: institution ?? this.institution,
      bio: bio ?? this.bio,
      picture: picture ?? this.picture,
      role: role ?? this.role,
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
      'role': role,
    };
  }

  factory PeopleModel.fromMap(Map<String, dynamic> map) {
    return PeopleModel(
      id: map['id'] as int,
      title: map['title'] != null ? map['title'] as String : null,
      name: map['name'] as String,
      institution:
          map['institution'] != null ? map['institution'] as String : null,
      bio: map['bio']['pt-br'] != null ? map['bio']['pt-br'] as String : null,
      picture: map['picture'] != null ? map['picture'] as String : null,
      role: map['role']['label']['pt-br'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PeopleModel.fromJson(String source) =>
      PeopleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PeopleModel(id: $id, title: $title, name: $name, institution: $institution, bio: $bio, picture: $picture, role: $role)';
  }

  @override
  bool operator ==(covariant PeopleModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.name == name &&
        other.institution == institution &&
        other.bio == bio &&
        other.picture == picture &&
        other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        name.hashCode ^
        institution.hashCode ^
        bio.hashCode ^
        picture.hashCode ^
        role.hashCode;
  }
}
