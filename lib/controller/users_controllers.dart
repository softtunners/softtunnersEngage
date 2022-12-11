import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/controller/auth_controller.dart';
import 'package:engage/modal/postModal.dart';
import 'package:engage/modal/userModal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class EngageUsersFire extends GetxController {
  // @override
  // void onInit() async {
  //   super.onInit();
  //   String uid = FirebaseAuth.instance.currentUser!.uid;
  //   DocumentSnapshot getDatasnap = await FirebaseFirestore.instance.collection("engageUsers").doc(uid).get();
  //   print(getDatasnap.data());
  // }

  final Rx<List<myUser>> _engageUser = Rx<List<myUser>>([]);

  List<myUser> get engageUser => _engageUser.value;

  @override
  void onInit() {
    super.onInit();
    _engageUser.bindStream(
      FirebaseFirestore.instance.collection("engagePost").snapshots().map((QuerySnapshot query) {
        List<myUser> retVel = [];
        for (var element in query.docs) {
          retVel.add(myUser.fromSnap(element));
        }
        return retVel;
      }),
    );
  }
}
