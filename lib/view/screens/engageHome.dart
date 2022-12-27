import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/controller/postlist_controller.dart';
import 'package:engage/modal/postModal.dart';
import 'package:engage/view/screens/auth/updateProfile.dart';
import 'package:engage/view/screens/engagePostView.dart';
import 'package:engage/view/widgets/engageHome/postNormal.dart';
import 'package:engage/view/widgets/engageHome/stories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// This page display the posts uploded by the users in realtime events, activities and feeds will be shown here.
class EngageHome extends StatefulWidget {
  const EngageHome({super.key});

  @override
  State<EngageHome> createState() => _EngageHomeState();
}

class _EngageHomeState extends State<EngageHome> {
  List userFireList = [];

  final EngagePostListController engagePostList = Get.put(EngagePostListController());

  Future<List<EngagePostModal>>? engagePostModal;
  List<EngagePostModal>? retriveEngagePosts;
// This _numberToMonth is used to convert TimeStamp into Date e.g(18, Aug)
  final _numberToMonth = {1: 'Jan', 2: 'Feb', 3: 'Mar', 4: 'Apr', 5: 'May', 6: 'Jun', 7: 'Jul', 8: 'Aug', 9: 'Sep', 10: 'Oct', 11: 'Nov', 12: 'Dec'};
  String uid = FirebaseAuth.instance.currentUser!.uid;

  Set get set => {};

  bool screenLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        screenLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return screenLoading
        ? SizedBox(
            width: double.infinity,
            height: Get.size.height,
            child: const Center(child: CircularProgressIndicator()),
          )
        : StreamBuilder(
            stream: FirebaseFirestore.instance.collection("engagePost").orderBy('timestamp', descending: true).snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    // This is the Custom Widget for Uploading Stories but at this moment it is just a static component and user cannot do anything dynamic with this.
                    const EngageStories(),
                    // This Contain Display's the posts uploded by the users
                    Container(
                      color: const Color.fromARGB(255, 235, 235, 235),
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
                              timestamp: 'Posted On ${date.day} ${_numberToMonth[date.month]}',
                              comment: document['commentsCount'],
                              likes: document['likes'].length,
                              id: document.id,
                              onPressed: () {
                                engagePostList.likedPost(document.id);
                              },
                              onTap: () {
                                Get.to(
                                  EngageFullPostView(
                                    set,
                                    postId: document['id'],
                                  ),
                                  transition: Transition.rightToLeft,
                                  duration: const Duration(milliseconds: 500),
                                );
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
