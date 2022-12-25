import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/controller/postlist_controller.dart';
import 'package:engage/view/widgets/GlobalWidgets/modalSheet.dart';
import 'package:engage/view/widgets/engageHome/fullPostView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// This page is used to to show post in full view

class EngageFullPostView extends StatelessWidget {
  final dynamic postId;
  EngageFullPostView(set, {super.key, required this.postId});

  final EngagePostListController engagePostList = Get.put(EngagePostListController());

  // _numberToMonthis used to show timeStamp in a date formet
  final _numberToMonth = {1: 'Jan', 2: 'Feb', 3: 'Mar', 4: 'Apr', 5: 'May', 6: 'Jun', 7: 'Jul', 8: 'Aug', 9: 'Sep', 10: 'Oct', 11: 'Nov', 12: 'Dec'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // Custom icon for Get.back()
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.chevron_left, color: Colors.white)),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('engagePost').doc(postId).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            Timestamp t = snapshot.data!['timestamp'] as Timestamp;
            DateTime date = t.toDate();
            return FullPostView(
              profile: snapshot.data!['profilePic'],
              image: snapshot.data!['post'],
              name: snapshot.data!['username'],
              designation: snapshot.data!['designation'],
              description: snapshot.data!['description'],
              timestamp: 'Posted On ${date.day} ${_numberToMonth[date.month]}',
              likes: snapshot.data!['likes'].length,
              comment: snapshot.data!['commentsCount'],
              onPressed: () {
                engagePostList.likedPost(snapshot.data!.id);
              },
              // when Long press it will opne a bottom sheet that will show wh has liked the post
              onLongPress: () {
                Get.bottomSheet(
                  EngageBottomSheet(
                    Set,
                    likesArray: snapshot.data!['id'],
                  ),
                );
              },
            );
          }),
    );
  }
}
