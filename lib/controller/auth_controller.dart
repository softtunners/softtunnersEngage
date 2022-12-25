import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/modal/userModal.dart';
import 'package:engage/view/screens/auth/engageLogin.dart';
import 'package:engage/view/screens/auth/engageRegister.dart';
import 'package:engage/view/screens/auth/updateProfile.dart';
import 'package:engage/view/screens/engageHome.dart';
import 'package:engage/view/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;

  User get user => _user.value!;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialView);
  }

  _setInitialView(User? user) {
    if (user == null) {
      Get.offAll(() => const EngageLogin());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  // Register User Controller

  void registerUser(String username, String email, String password, String confirmPassword) async {
    try {
      if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty) {
        UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

        const avatarImg = 'https://firebasestorage.googleapis.com/v0/b/engage-29a68.appspot.com/o/Assets%2FImages%2Fuser.png?alt=media&token=798133d5-f41d-4ee8-8c16-06573a9e9a4d';

        myUser engageUser = myUser(
            name: username,
            email: email,
            uid: credential.user!.uid,
            password: password,
            confirmPassword: confirmPassword,
            bio: '',
            department: '',
            designation: '',
            dob: '',
            mobileNo: 0,
            posts: [],
            avatar: avatarImg);

        await FirebaseFirestore.instance.collection("engageUsers").doc(credential.user!.uid).set(engageUser.toJson());

        Get.snackbar("Registered Successfully", "You have been registered successfully", snackPosition: SnackPosition.TOP, backgroundColor: Color(0xffffffff));
      } else {
        Get.snackbar("Error Creating an Account", "Please Enter all the required fields", snackPosition: SnackPosition.TOP, backgroundColor: Color(0xffffffff));
      }
    } catch (e) {
      Get.snackbar("Error Occured", e.toString(), snackPosition: SnackPosition.TOP, backgroundColor: Color(0xffffffff));
    }
  }

  // Login User
  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        Get.snackbar("Logged In", "You will been successfully logged in", snackPosition: SnackPosition.TOP, backgroundColor: Color(0xffffffff));
      } else {
        Get.snackbar("Invalid Credientials", "Please Enter Vaild Login Credientials", snackPosition: SnackPosition.TOP, backgroundColor: Color(0xffffffff));
      }
    } catch (e) {
      Get.snackbar("Error Occured", e.toString(), snackPosition: SnackPosition.TOP, backgroundColor: Color(0xffffffff));
    }
  }

  // SignOut User
  Future<EngageLogin> signOutUser() async {
    await FirebaseAuth.instance.signOut();
    return const EngageLogin();
  }
}
