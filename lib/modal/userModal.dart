import 'package:cloud_firestore/cloud_firestore.dart';

class myUser {
  String name;
  String email;
  String uid;
  String password;
  String confirmPassword;

  String designation;
  String bio;
  int mobileNo;
  String dob;
  String department;
  List posts;

  myUser({
    required this.name,
    required this.email,
    required this.uid,
    required this.password,
    required this.confirmPassword,
    required this.designation,
    required this.bio,
    required this.mobileNo,
    required this.dob,
    required this.department,
    required this.posts,
  });
  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "uid": uid,
        "confirmPassword": confirmPassword,
        "designation": designation,
        "bio": bio,
        "mobileNo": mobileNo,
        "dob": dob,
        "department": department,
        "posts": posts,
      };

  static myUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return myUser(
      name: snapshot['name'],
      email: snapshot['email'],
      password: snapshot['password'],
      uid: snapshot['uid'],
      confirmPassword: snapshot['confirmPassword'],
      bio: snapshot['bio'],
      department: snapshot['department'],
      designation: snapshot['designation'],
      dob: snapshot['dob'],
      mobileNo: snapshot['mobileNo'],
      posts: snapshot['posts'],
    );
  }
}
