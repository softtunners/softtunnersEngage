import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/controller/users_controllers.dart';
import 'package:engage/modal/profileModal.dart';
import 'package:engage/view/widgets/GlobalWidgets/profileListType.dart';
import 'package:engage/view/widgets/GlobalWidgets/textInput.dart';
import 'package:engage/view/widgets/engageProfile/userProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class EngageProfileOfUser extends StatefulWidget {
  final dynamic userData;
  EngageProfileOfUser(
    Set set, {
    super.key,
    required this.userData,
  });

  @override
  State<EngageProfileOfUser> createState() => _EngageProfileOfUserState();
}

class _EngageProfileOfUserState extends State<EngageProfileOfUser> {
  TextEditingController _search = new TextEditingController();

  EngageUsersFire engageUsersFire = Get.put(EngageUsersFire());

  static String? get uid => FirebaseAuth.instance.currentUser!.uid;
  Future<DocumentSnapshot<Map<String, dynamic>>> getData = FirebaseFirestore.instance.collection("engageUsers").doc(uid).get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('engageUsers').doc(widget.userData).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return UserProfile(
              name: snapshot.data!['name'],
              designation: snapshot.data!['name'],
              bio: snapshot.data!['name'],
              mobileNo: 11,
              email: snapshot.data!['name'],
              dob: snapshot.data!['name'],
              joinedDate: snapshot.data!['name'],
              department: snapshot.data!['name'],
              profile: snapshot.data!['name'],
            );
          }),
    );
  }
}
