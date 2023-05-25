// To parse this JSON data, do
//
//     final suggests = suggestsFromJson(jsonString);

import 'dart:convert';

Suggests suggestsFromJson(String str) => Suggests.fromJson(json.decode(str));

String suggestsToJson(Suggests data) => json.encode(data.toJson());

class Suggests {
  Suggests({
    required this.users,
  });

  List<User> users;

  factory Suggests.fromJson(Map<String, dynamic> json) => Suggests(
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
  };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.lastname,
    this.email,
    this.emailVerifiedAt,
    this.gender,
    this.birthdate,
    this.job,
    this.study,
    required this.profilePhoto,
    this.coverPhoto,
    required this.path,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String lastname;
  String? email;
  dynamic emailVerifiedAt;
  dynamic gender;
  dynamic birthdate;
  dynamic job;
  dynamic study;
  String profilePhoto;
  String? coverPhoto;
  String path;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    gender: json["gender"],
    birthdate: json["birthdate"],
    job: json["job"],
    study: json["study"],
    profilePhoto: json["profile_photo"],
    coverPhoto: json["cover_photo"],
    path: json["path"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastname": lastname,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "gender": gender,
    "birthdate": birthdate,
    "job": job,
    "study": study,
    "profile_photo": profilePhoto,
    "cover_photo": coverPhoto,
    "path": path,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
