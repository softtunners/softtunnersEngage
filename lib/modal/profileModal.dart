// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserProfileMoal {
//   String avatarpath;
//   String designation;
//   String bio;
//   int mobileNo;
//   String dob;
//   String department;
//   List posts;

//   UserProfileMoal({
//     required this.avatarpath,
//     required this.designation,
//     required this.bio,
//     required this.mobileNo,
//     required this.dob,
//     required this.department,
//     required this.posts,
//   });
//   Map<String, dynamic> toJson() => {
//         "avatar": avatarpath,
//         "designation": designation,
//         "bio": bio,
//         "mobileNo": mobileNo,
//         "dob": dob,
//         "department": department,
//         "posts": posts,
//       };

//   static UserProfileMoal fromSnap(DocumentSnapshot snap) {
//     var snapshot = snap.data() as Map<String, dynamic>;
//     return UserProfileMoal(
//       avatarpath: snapshot['avatarpath'],
//       bio: snapshot['bio'],
//       department: snapshot['department'],
//       designation: snapshot['designation'],
//       dob: snapshot['dob'],
//       mobileNo: snapshot['mobileNo'],
//       posts: snapshot['posts'],
//     );
//   }
// }

class UserProfileMoal {
  String avatarpath;
  String designation;
  String bio;
  int mobileNo;
  String dob;
  String department;
  List posts;

  UserProfileMoal({
    required this.avatarpath,
    required this.designation,
    required this.bio,
    required this.mobileNo,
    required this.dob,
    required this.department,
    required this.posts,
  });

  factory UserProfileMoal.fromJson(Map<String, dynamic> json) {
    return UserProfileMoal(
      avatarpath: json['name'],
      department: json['name'],
      designation: json['name'],
      bio: json['name'],
      mobileNo: json['name'],
      dob: json['name'],
      posts: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "avatar": avatarpath,
      "designation": designation,
      "bio": bio,
      "mobileNo": mobileNo,
      "dob": dob,
      "department": department,
      "posts": posts,
    };
  }
}
