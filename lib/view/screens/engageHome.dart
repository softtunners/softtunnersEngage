import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/controller/post_controller.dart';
import 'package:engage/controller/postlist_controller.dart';
import 'package:engage/modal/postModal.dart';
import 'package:engage/view/widgets/GlobalWidgets/profileListType.dart';
import 'package:engage/view/widgets/engageHome/postNormal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EngageHome extends StatefulWidget {
  EngageHome({super.key});

  @override
  State<EngageHome> createState() => _EngageHomeState();
}

class _EngageHomeState extends State<EngageHome> {
  List userFireList = [];

  final EngagePostListController engagePostList = Get.put(EngagePostListController());

  Future<List<EngagePostModal>>? engagePostModal;
  List<EngagePostModal>? retriveEngagePosts;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("engagePost").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
            children: snapshot.data!.docs.map<Widget>((document) {
          return EngagePostOne(
            profile: document['profilePic'],
            image: document['post'],
            name: document['username'],
            designation: document['designation'],
            description: document['description'],
            timestamp: document['username'],
            comment: document['commentsCount'],
            likes: document['likes'].length,
          );
        }).toList());
      },
    );
  }
}


// widget.id