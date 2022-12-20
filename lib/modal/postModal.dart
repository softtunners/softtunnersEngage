import 'package:cloud_firestore/cloud_firestore.dart';

class EngagePostModal {
  String name;
  String uid;
  String id;
  List likes;
  int commentsCount;
  String description;
  String post;
  String profilePic;
  String designation;
  String postTitle;
  FieldValue timestamp;

  EngagePostModal(
      {required this.name,
      required this.uid,
      required this.id,
      required this.likes,
      required this.commentsCount,
      required this.description,
      required this.post,
      required this.designation,
      required this.profilePic,
      required this.postTitle,
      required this.timestamp});
  Map<String, dynamic> toJson() => {
        "username": name,
        "uid": uid,
        "id": id,
        "likes": likes,
        "commentsCount": commentsCount,
        "description": description,
        "post": post,
        "designation": designation,
        "profilePic": profilePic,
        "postTitle": postTitle,
        "timestamp": timestamp,
      };

  static EngagePostModal fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return EngagePostModal(
      name: snapshot['name'],
      uid: snapshot['uid'],
      id: snapshot['id'],
      likes: snapshot['likes'],
      commentsCount: snapshot['commentsCount'],
      post: snapshot['post'],
      description: snapshot['description'],
      designation: snapshot['designation'],
      profilePic: snapshot['profilePic'],
      postTitle: snapshot['postTitle'],
      timestamp: snapshot['timestamp'],
    );
  }
}
