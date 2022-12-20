import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/controller/auth_controller.dart';
import 'package:engage/modal/postModal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class EngagePostListController extends GetxController {
  // final Rx<List<EngagePostModal>> _engagePostList = Rx<List<EngagePostModal>>([]);

  // List<EngagePostModal> get engagePostModalList => _engagePostList.value;

  // @override
  // void onInit() {
  //   super.onInit();
  //   _engagePostList.bindStream(
  //     FirebaseFirestore.instance.collection("engagePost").snapshots().map((QuerySnapshot query) {
  //       List<EngagePostModal> retVel = [];
  //       for (var element in query.docs) {
  //         retVel.add(EngagePostModal.fromSnap(element));
  //       }
  //       return retVel;
  //     }),
  //   );
  // }

  likedPost(String id) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection("engagePost").doc(id).get();
    var uid = AuthController.instance.user.uid;
    if ((doc.data() as dynamic)['likes'].contains(uid)) {
      await FirebaseFirestore.instance.collection("engagePost").doc(id).update({
        'likes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await FirebaseFirestore.instance.collection("engagePost").doc(id).update({
        "likes": FieldValue.arrayUnion(
          [uid],
        )
      });
    }
  }

  // likedButton() {

  // LikeButton(
  //   size: 24,
  //   circleColor: const CircleColor(start: Color.fromARGB(255, 255, 0, 34), end: Color.fromARGB(255, 204, 24, 0)),
  //   bubblesColor: const BubblesColor(
  //     dotPrimaryColor: Color.fromARGB(255, 230, 65, 15),
  //     dotSecondaryColor: Color.fromARGB(255, 204, 0, 0),
  //   ),
  //   likeBuilder: (bool isLiked) {
  //     return isLiked
  //         ? const Icon(
  //             Icons.favorite,
  //             color: Color.fromARGB(255, 245, 196, 193),
  //             size: 24,
  //           )
  //         : const Icon(
  //             Icons.favorite_border,
  //             color: Colors.grey,
  //             size: 24,
  //           );
  //   },
  //   likeCount: 1,
  //   onTap: ((isLiked) {

  //   }
  // ));

}
