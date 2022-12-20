import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/modal/postModal.dart';
import 'package:engage/modal/profileModal.dart';
import 'package:engage/view/screens/engageUserProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ProfileUpdateController extends GetxController {
  static ProfileUpdateController instance = Get.find();

    var uuid = Uuid();

  FirebaseStorage storage = FirebaseStorage.instance;

  File? photo;
  final ImagePicker picker = ImagePicker();

  updateProfile(String designation, String bio, String dob, int mobileNo, String department, File postAvatar) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection("engageUsers").doc(uid).get();

      Reference ref = FirebaseStorage.instance.ref('avatars').child(postAvatar.toString());
      UploadTask uploadTask = ref.putFile(photo!);
      TaskSnapshot snapshot = await uploadTask;
      String avatarUrl = await snapshot.ref.getDownloadURL();
      

      var engageUsers = UserProfileMoal(
        designation: designation,
        bio: bio,
        mobileNo: mobileNo,
        dob: dob,
        department: department,
        posts: [],
        avatarpath: avatarUrl,
      );

      await FirebaseFirestore.instance.collection("engageUsers").doc(uid).update(engageUsers.toJson());
      Get.snackbar("User's Data has been updated", "Your Post has been lined up into the home page");
    } catch (e) {
      Get.snackbar("Error ", e.toString());
    }
  }

    uploadPostId(){
    try{
      String id = uuid.v1();
      final postCollection = FirebaseFirestore.instance.collection('engagePost').doc(id).get();
    }catch(e){}
  }


}
