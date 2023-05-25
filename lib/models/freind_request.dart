// To parse this JSON data, do
//
//     final freindRequest = freindRequestFromJson(jsonString);

import 'dart:convert';

FreindRequest freindRequestFromJson(String str) => FreindRequest.fromJson(json.decode(str));

String freindRequestToJson(FreindRequest data) => json.encode(data.toJson());

class FreindRequest {
  FreindRequest({
    required this.requester,
  });

  List<Requester> requester;

  factory FreindRequest.fromJson(Map<String, dynamic> json) => FreindRequest(
    requester: List<Requester>.from(json["requester"].map((x) => Requester.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "requester": List<dynamic>.from(requester.map((x) => x.toJson())),
  };
}

class Requester {
  Requester({
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
     this.path,
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
  String? study;
  String profilePhoto;
  String? coverPhoto;
  String? path;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Requester.fromJson(Map<String, dynamic> json) => Requester(
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
