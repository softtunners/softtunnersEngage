import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/controller/auth_controller.dart';
import 'package:engage/modal/postModal.dart';
import 'package:get/get.dart';

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
}
