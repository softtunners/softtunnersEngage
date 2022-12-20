import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/controller/post_controller.dart';
import 'package:engage/controller/postlist_controller.dart';
import 'package:engage/modal/postModal.dart';
import 'package:engage/view/widgets/GlobalWidgets/profileListType.dart';
import 'package:engage/view/widgets/engageHome/postNormal.dart';
import 'package:engage/view/widgets/engageHome/stories.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  var _numberToMonth = {1: 'Jan', 2: 'Feb', 3: 'Mar', 4: 'Apr', 5: 'May', 6: 'Jun', 7: 'Jul', 8: 'Aug', 9: 'Sep', 10: 'Oct', 11: 'Nov', 12: 'Dec'};
  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("engagePost").orderBy('timestamp', descending: true).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              EngageStories(),
              Container(
                color: Color.fromARGB(255, 235, 235, 235),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: snapshot.data!.docs.map<Widget>((document) {
                      Timestamp t = document['timestamp'] as Timestamp;
                      DateTime date = t.toDate();
                      return EngagePostOne(
                        profile: document['profilePic'],
                        image: document['post'],
                        name: document['username'],
                        designation: document['designation'],
                        description: document['description'],
                        timestamp: ' Posted On ${date.day} ${_numberToMonth[date.month]}',
                        comment: document['commentsCount'],
                        likes: document['likes'].length,
                        onPressed: () {
                          engagePostList.likedPost(document.id);
                        },
                      );
                    }).toList()),
              ),
            ],
          ),
        );
      },
    );
  }
}
