import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/controller/users_controllers.dart';
import 'package:engage/view/widgets/GlobalWidgets/profileListType.dart';
import 'package:engage/view/widgets/GlobalWidgets/textInput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class EngageUsers extends StatefulWidget {
  EngageUsers({super.key});

  @override
  State<EngageUsers> createState() => _EngageUsersState();
}

class _EngageUsersState extends State<EngageUsers> {
  TextEditingController _search = new TextEditingController();

  EngageUsersFire engageUsersFire = Get.put(EngageUsersFire());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("engageUsers").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: snapshot.data!.docs.map<Widget>((document) {
            return EngageUserWidget(
              designation: document['designation'],
              avatar: 'assets/images/user.png',
              name: document['name'],
            );
          }).toList(),
        );
      },
    );
  }
}
