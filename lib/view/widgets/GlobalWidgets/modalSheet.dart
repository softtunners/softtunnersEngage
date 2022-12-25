import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// This page contains The Bottom Sheet Widget that show user count and likes
class EngageBottomSheet extends StatelessWidget {
  final dynamic likesArray;
  EngageBottomSheet(set, {super.key, required this.likesArray});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        color: Colors.white,
      ),
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: InkWell(
              onTap: () => Get.back(),
              child: Container(margin: const EdgeInsets.all(10), width: 50, height: 10, decoration: BoxDecoration(color: Get.theme.colorScheme.primary, borderRadius: BorderRadius.circular(10))),
            ),
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance.collection('engagePost').doc(likesArray.toString()).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Container(
                  height: 390,
                  child: ListView.builder(
                    itemCount: snapshot.data!['likes'].length,
                    itemBuilder: ((context, index) {
                      final like = snapshot.data!['likes'].length;
                      return StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('engageUsers').doc(snapshot.data!['likes'][index]).snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Text('No Body has likesd your post yet');
                            }
                            return Container(
                              decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(width: 1, color: Get.theme.colorScheme.background))),
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  CircleAvatar(backgroundColor: Colors.white, radius: 20, backgroundImage: NetworkImage(snapshot.data!['avatar'])),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(snapshot.data!['name'], textAlign: TextAlign.left, style: GoogleFonts.poppins(textStyle: Get.theme.textTheme.subtitle1)),
                                      Text(snapshot.data!['designation'], style: GoogleFonts.poppins(textStyle: Get.theme.textTheme.subtitle2))
                                    ],
                                  )
                                ],
                              ),
                            );
                          });
                    }),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
