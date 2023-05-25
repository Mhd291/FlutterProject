// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

Comment commentFromJson(String str) => Comment.fromJson(json.decode(str));

String commentToJson(Comment data) => json.encode(data.toJson());

class Comment {
    Comment({
        required this.comments,
    });

    List<CommentElement> comments;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        comments: List<CommentElement>.from(json["comments"].map((x) => CommentElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
    };
}

class CommentElement {
    CommentElement({
         this.id,
        this.createdAt,
        this.isMyComment,
        this.userId,
        this.name,
        this.lastname,
        this.profilePhoto,
        this.profilePhotoPath,
        this.postId,
        this.value,
        this.fileComment,
        this.pathFileComment,
    });

    int? id;
    DateTime? createdAt;
    int? isMyComment;
    int? userId;
    String? name;
    String? lastname;
    String? profilePhoto;
    String? profilePhotoPath;
    int? postId;
    String? value;
    String? fileComment;
    String? pathFileComment;

    factory CommentElement.fromJson(Map<String, dynamic> json) => CommentElement(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        isMyComment: json["is_my_comment"],
        userId: json["user_id"],
        name: json["name"],
        lastname: json["lastname"],
        profilePhoto: json["profile_photo"],
        profilePhotoPath: json["profile_photo_path"],
        postId: json["post_id"],
        value: json["value"],
        fileComment: json["file_comment"],
        pathFileComment: json["path_file_comment"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt!.toIso8601String(),
        "is_my_comment": isMyComment,
        "user_id": userId,
        "name": name,
        "lastname": lastname,
        "profile_photo": profilePhoto,
        "profile_photo_path": profilePhotoPath,
        "post_id": postId,
        "value": value,
        "file_comment": fileComment,
        "path_file_comment": pathFileComment,
    };
}
