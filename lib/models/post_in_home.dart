// To parse this JSON data, do
//
//     final homePosts = homePostsFromJson(jsonString);

import 'dart:convert';

HomePosts homePostsFromJson(String str) => HomePosts.fromJson(json.decode(str));

String homePostsToJson(HomePosts data) => json.encode(data.toJson());

class HomePosts {
  HomePosts({
    required this.posts,
  });

  List<Post> posts;

  factory HomePosts.fromJson(Map<String, dynamic> json) => HomePosts(
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
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
  List<Image>? images;
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
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
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
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
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
