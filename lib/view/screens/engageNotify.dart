import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/controller/users_controllers.dart';
import 'package:engage/view/screens/engageUserProfile.dart';
import 'package:engage/view/widgets/GlobalWidgets/profileListType.dart';
import 'package:engage/view/widgets/GlobalWidgets/textInput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class EngageNotify extends StatefulWidget {
  EngageNotify({super.key});

  @override
  State<EngageNotify> createState() => _EngageNotifyState();
}

class _EngageNotifyState extends State<EngageNotify> {
  TextEditingController _search = new TextEditingController();

  EngageUsersFire engageUsersFire = Get.put(EngageUsersFire());

  Set get set => {};

  @override
  Widget build(BuildContext context) {
    return Text('Notify');
  }
}
