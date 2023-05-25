// To parse this JSON data, do
//
//     final myProfile = myProfileFromJson(jsonString);

import 'dart:convert';

MyProfile myProfileFromJson(String str) => MyProfile.fromJson(json.decode(str));

String myProfileToJson(MyProfile data) => json.encode(data.toJson());

class MyProfile {
  MyProfile({
    required this.user,
    required this.friends,
    this.adds,
    required this.posts,
  });

  User user;
  List<User> friends;
  List<dynamic>? adds;
  List<Post> posts;

  factory MyProfile.fromJson(Map<String, dynamic> json) => MyProfile(
    user: User.fromJson(json["user"]),
    friends: List<User>.from(json["friends"].map((x) => User.fromJson(x))),
    adds: List<dynamic>.from(json["adds "].map((x) => x)),
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "friends": List<dynamic>.from(friends.map((x) => x.toJson())),
   // "adds ": List<dynamic>.from(adds!.map((x) => x)),
    "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
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
    required this.coverPhoto,
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
  String coverPhoto;
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

class Post {
  Post({
    required this.id,
    required this.createdAt,
    required this.body,
    this.userId,
    required this.userName,
    required this.userLastname,
    required this.userProfilePhoto,
    this.images,
    required this.likes,
    required this.isliked,
    this.comment,
  });

  int id;
  DateTime createdAt;
  String body;
  int? userId;
  String userName;
  String userLastname;
  String userProfilePhoto;
  List<Image>? images;
  List<dynamic> likes;
  int isliked;
  List<Comment>? comment;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    body: json["body"],
    userId: json["user_id"],
    userName: json["user_name"],
    userLastname: json["user_lastname"],
    userProfilePhoto: json["user_profile_photo"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    likes: List<dynamic>.from(json["likes"].map((x) => x)),
    isliked: json["isliked"],
    comment: List<Comment>.from(json["comment"].map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "body": body,
    "user_id": userId,
    "user_name": userName,
    "user_lastname": userLastname,
    "user_profile_photo": userProfilePhoto,
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
    "likes": List<dynamic>.from(likes.map((x) => x)),
    "isliked": isliked,
    "comment": List<dynamic>.from(comment!.map((x) => x.toJson())),
  };
}

class Comment {
  Comment({
    this.id,
    this.userId,
    this.postId,
    this.value,
    this.fileComment,
    this.path,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  int? postId;
  String? value;
  String? fileComment;
  String? path;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    userId: json["user_id"],
    postId: json["post_id"],
    value: json["value"],
    fileComment: json["file_comment"],
    path: json["path"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "post_id": postId,
    "value": value,
    "file_comment": fileComment,
    "path": path,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class Image {
  Image({
    this.id,
    this.name,
    this.postId,
    this.path,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  int? postId;
  String? path;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    name: json["name"],
    postId: json["post_id"],
    path: json["path"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "post_id": postId,
    "path": path,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
