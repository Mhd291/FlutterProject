// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    required this.users,
  });

  List<User> users;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
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
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
