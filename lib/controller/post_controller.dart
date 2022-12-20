import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/modal/postModal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
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

  // Future uploadFile() async {
  //   // if (photo != null) return;
  //   final filename = photo;
  //   final destination = 'engagePost/$filename';
  //   try {
  //     Reference ref = FirebaseStorage.instance.ref('file').child(destination);
  //     UploadTask uploadTask = ref.putFile(photo!);
  //     TaskSnapshot snapshot = await uploadTask;
  //     String imageUrl = await snapshot.ref.getDownloadURL();
  //     return imageUrl;
  //   } catch (e) {
  //     print('error occured');
  //   }
  // }

  uploadPost(String description, File postImage, String postTitle) async {
    try {
      final filename = photo;
      final destination = 'engagePost/$filename';

      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection("engageUsers").doc(uid).get();
      String id = uuid.v1();
      // await uploadFile();

      Reference ref = FirebaseStorage.instance.ref('file').child(destination);
      UploadTask uploadTask = ref.putFile(photo!);
      TaskSnapshot snapshot = await uploadTask;
      String imageUrl = await snapshot.ref.getDownloadURL();
      // return imageUrl;

      var engagePost = EngagePostModal(
        name: (userDoc.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        id: id,
        likes: [],
        commentsCount: 0,
        description: description,
        post: imageUrl,
        designation: "Head of Mobile & Products",
        profilePic: (userDoc.data()! as Map<String, dynamic>)['avatar'],
        postTitle: postTitle,
        timestamp: FieldValue.serverTimestamp(),
      );

      await FirebaseFirestore.instance.collection("engagePost").doc(id).set(engagePost.toJson());
      Get.snackbar("Post Uploaded Successfully", "Your Post has been lined up into the home page");
    } catch (e) {
      Get.snackbar("Error Uploading Post", e.toString());
    }
  }



}
