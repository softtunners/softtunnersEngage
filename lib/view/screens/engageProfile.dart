import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/view/widgets/engageProfile/profileView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class EngageProfile extends StatelessWidget {
  EngageProfile({super.key});

  static String? get uid => FirebaseAuth.instance.currentUser!.uid;
  // Future<DocumentSnapshot<Map<String, dynamic>>> getData = FirebaseFirestore.instance.collection("engageUsers").doc(uid).get();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('engageUsers').doc(uid).snapshots(),
      builder: (context, snapshot) {
        print(snapshot.data!.data());
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: ProfileView(
                name: snapshot.data!['name'],
                designation: snapshot.data!['department'],
                bio: snapshot.data!['bio'],
                mobileNo: snapshot.data!['mobileNo'].toString(),
                email: snapshot.data!['email'],
                dob: snapshot.data!['dob'],
                joinedDate: snapshot.data!['dob'],
                department: snapshot.data!['department'],
                profile: snapshot.data!['avatar']));
      },
    );
  }
}
