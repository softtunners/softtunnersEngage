import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/modal/postModal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class UploadPostController extends GetxController {
  static UploadPostController instance = Get.find();

  var uuid = Uuid();

  FirebaseStorage storage = FirebaseStorage.instance;

  File? photo;

  final ImagePicker picker = ImagePicker();

  Future uploadFile() async {
    if (photo != null) return;
    final filename = photo!.path;
    final destination = 'engagePost/$filename';

    try {
      Reference ref = FirebaseStorage.instance.ref('file').child(destination);
      await ref.putFile(photo!);
    } catch (e) {
      print('error occured');
    }
  }

  uploadPost(String description, File postImage, String postTitle) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection("engageUsers").doc(uid).get();
      String id = uuid.v1();
      File? engageImage = await uploadFile();

      var engagePost = EngagePostModal(
        name: (userDoc.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        id: id,
        likes: [],
        commentsCount: 0,
        description: description,
        post: engageImage.toString(),
        designation: "Head of Mobile & Products",
        profilePic: "assets/images/post2.jpg",
        postTitle: postTitle,
      );
      await FirebaseFirestore.instance.collection("engagePost").doc(id).set(engagePost.toJson());
      Get.snackbar("Post Uploaded Successfully", "Your Post has been lined up into the home page");
    } catch (e) {
      Get.snackbar("Error Uploading Post", e.toString());
    }
  }

  // final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Future<List<EngagePostModal>> retriveEngagePost() async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot = await _db.collection('engagePost').get();
  //   return snapshot.docs.map((docsSnapshot) => EngagePostModal.fromSnap(docsSnapshot)).toList();
  // }

  // getPost() async {
  //   String id = uuid.v1();
  //   // String uid = FirebaseAuth.instance.currentUser!.uid;
  //   DocumentSnapshot getDatasnap = await FirebaseFirestore.instance.collection("engagePost").doc(id).snapshots();
  //   print(getDatasnap.data());
  // }
}
