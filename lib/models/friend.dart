// To parse this JSON data, do
//
//     final friend = friendFromJson(jsonString);

import 'dart:convert';

Friend friendFromJson(String str) => Friend.fromJson(json.decode(str));

String friendToJson(Friend data) => json.encode(data.toJson());

class Friend {
  Friend({
    required this.friends,
  });

  List<FriendElement> friends;

  factory Friend.fromJson(Map<String, dynamic> json) => Friend(
    friends: List<FriendElement>.from(json["friends"].map((x) => FriendElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "friends": List<dynamic>.from(friends.map((x) => x.toJson())),
  };
}

class FriendElement {
  FriendElement({
    required this.id,
    required this.name,
    required this.lastname,
    this.email,
    this.emailVerifiedAt,
    this.gender,
    this.birthdate,
    this.job,
    required this.study,
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
  String? gender;
  String? birthdate;
  dynamic job;
  dynamic study;
  String profilePhoto;
  String? coverPhoto;
  String path;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory FriendElement.fromJson(Map<String, dynamic> json) => FriendElement(
    id: json["id"],
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    gender: json["gender"] == null ? null : json["gender"],
    birthdate: json["birthdate"] == null ? null : json["birthdate"],
    job: json["job"],
    study: json["study"] == null ? null : json["study"],
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
    "gender": gender == null ? null : gender,
    "birthdate": birthdate == null ? null : birthdate,
    "job": job,
    "study": study == null ? null : study,
    "profile_photo": profilePhoto,
    "cover_photo": coverPhoto,
    "path": path,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
