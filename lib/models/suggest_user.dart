// To parse this JSON data, do
//
//     final suggestUser = suggestUserFromJson(jsonString);

import 'dart:convert';

SuggestUser suggestUserFromJson(String str) => SuggestUser.fromJson(json.decode(str));

String suggestUserToJson(SuggestUser data) => json.encode(data.toJson());

class SuggestUser {
  SuggestUser({
    this.user,
    this.friends,
    this.isFriendWith,
    this.friendRequestReceive,
    this.friendRequestSent,
    this.posts,
  });

  User? user;
  List<User>? friends;
  int? isFriendWith;
  int? friendRequestReceive;
  int? friendRequestSent;
  List<Post>? posts;

  factory SuggestUser.fromJson(Map<String, dynamic> json) => SuggestUser(
    user: User.fromJson(json["user"]),
    friends: List<User>.from(json["friends"].map((x) => User.fromJson(x))),
    isFriendWith: json["isFriendWith"],
    friendRequestReceive: json["friendRequestReceive"],
    friendRequestSent: json["friendRequestSent"],
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "user": user!.toJson(),
    "friends": List<dynamic>.from(friends!.map((x) => x.toJson())),
    "isFriendWith": isFriendWith,
    "friendRequestReceive": friendRequestReceive,
    "friendRequestSent": friendRequestSent,
    "posts": List<dynamic>.from(posts!.map((x) => x.toJson())),
  };
}

class User {
  User({
    this.id,
    this.name,
    this.lastname,
    this.email,
    this.emailVerifiedAt,
    this.gender,
    this.birthdate,
    this.job,
    this.study,
    this.profilePhoto,
    this.coverPhoto,
    this.path,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? lastname;
  String? email;
  dynamic emailVerifiedAt;
  String? gender;
  String? birthdate;
  String? job;
  String? study;
  String? profilePhoto;
  String? coverPhoto;
  String? path;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    gender: json["gender"] == null ? null : json["gender"],
    birthdate: json["birthdate"] == null ? null : json["birthdate"],
    job: json["job"] == null ? null : json["job"],
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
    "job": job == null ? null : job,
    "study": study == null ? null : study,
    "profile_photo": profilePhoto,
    "cover_photo": coverPhoto,
    "path": path,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class Post {
  Post({
    this.id,
    this.createdAt,
    this.body,
    this.userId,
    this.userName,
    this.userLastname,
    this.userProfilePhoto,
    this.images,
    this.likes,
    this.isliked,
    this.comment,
  });

  int? id;
  DateTime? createdAt;
  String? body;
  int? userId;
  String? userName;
  String? userLastname;
  String? userProfilePhoto;
  List<dynamic>? images;
  List<dynamic>? likes;
  int? isliked;
  List<Comment>? comment;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    body: json["body"],
    userId: json["user_id"],
    userName: json["user_name"],
    userLastname: json["user_lastname"],
    userProfilePhoto: json["user_profile_photo"],
    images: List<dynamic>.from(json["images"].map((x) => x)),
    likes: List<dynamic>.from(json["likes"].map((x) => x)),
    isliked: json["isliked"],
    comment: List<Comment>.from(json["comment"].map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt!.toIso8601String(),
    "body": body,
    "user_id": userId,
    "user_name": userName,
    "user_lastname": userLastname,
    "user_profile_photo": userProfilePhoto,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "likes": List<dynamic>.from(likes!.map((x) => x)),
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
