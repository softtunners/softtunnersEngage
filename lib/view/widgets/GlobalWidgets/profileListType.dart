import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/controller/profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// This is the global level widget thaht is useful for showing current user listtype widget
class EngageUserWidget extends StatelessWidget {
  EngageUserWidget({
    super.key,
  });

  static String? get uid => FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('engageUsers').doc(uid).snapshots(),
        builder: (context, snapshot) {
          return InkWell(
            splashColor: Get.theme.colorScheme.background,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    backgroundImage: NetworkImage(snapshot.data!['avatar']),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!['name'],
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          textStyle: Get.theme.textTheme.subtitle1,
                        ),
                      ),
                      Text(
                        snapshot.data!['designation'],
                        style: GoogleFonts.poppins(
                          textStyle: Get.theme.textTheme.subtitle2,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

// This is the global level widget which is used for showing registered users in Idealakers Page
class EngageIdeaUsers extends StatelessWidget {
  final String avatar;
  final String name;
  final String designation;
  final void Function()? onTap;

  const EngageIdeaUsers({
    super.key,
    required this.avatar,
    required this.name,
    required this.designation,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Get.theme.colorScheme.background,
      onTap: onTap,
      splashColor: Get.theme.colorScheme.background,
      child: Container(
        decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(width: 1, color: Get.theme.colorScheme.background))),
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(backgroundColor: Colors.white, radius: 20, backgroundImage: NetworkImage(avatar)),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, textAlign: TextAlign.left, style: GoogleFonts.poppins(textStyle: Get.theme.textTheme.subtitle1)),
                Text(designation, style: GoogleFonts.poppins(textStyle: Get.theme.textTheme.subtitle2))
              ],
            )
          ],
        ),
      ),
    );
  }
}
