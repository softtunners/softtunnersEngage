import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/controller/users_controllers.dart';
import 'package:engage/view/widgets/GlobalWidgets/profileListType.dart';
import 'package:engage/view/widgets/GlobalWidgets/textInput.dart';
import 'package:engage/view/widgets/engageProfile/userProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class EngageProfileOfUser extends StatefulWidget {
  EngageProfileOfUser({super.key});

  @override
  State<EngageProfileOfUser> createState() => _EngageProfileOfUserState();
}

class _EngageProfileOfUserState extends State<EngageProfileOfUser> {
  TextEditingController _search = new TextEditingController();

  EngageUsersFire engageUsersFire = Get.put(EngageUsersFire());

  Future<DocumentSnapshot<Map<String, dynamic>>> getData = FirebaseFirestore.instance.collection("engageUsers").doc(uid).get();

  static String? get uid => FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData,
      builder: (context, snapshot) {
        return UserProfile(
            name: (getData as Map<String, dynamic>)['name'],
            designation: (getData as Map<String, dynamic>)['name'],
            bio: (getData as Map<String, dynamic>)['name'],
            mobileNo: 11,
            email: (getData as Map<String, dynamic>)['name'],
            dob: (getData as Map<String, dynamic>)['name'],
            joinedDate: (getData as Map<String, dynamic>)['name'],
            department: (getData as Map<String, dynamic>)['name'],
            profile: (getData as Map<String, dynamic>)['name']);
      },

      //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (!snapshot.hasData) {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //     return ListView(
      //       children: snapshot.data!.docs.map<Widget>((document) {
      //         return UserProfile(
      //             name: document['name'],
      //             designation: document['designation'],
      //             bio: document['bio'],
      //             mobileNo: document['mobileNo'],
      //             email: document['email'],
      //             dob: document['dob'],
      //             joinedDate: document[''],
      //             department: document['department'],
      //             profile: document['']);
      //       }).toList(),
      //     );
      //   },
      // );
    );
  }
}
