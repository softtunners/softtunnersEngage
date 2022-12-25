import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/view/screens/engagePostView.dart';
import 'package:engage/view/widgets/engageProfile/profileView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class EngageProfile extends StatelessWidget {
  EngageProfile({super.key});

  static String? get uid => FirebaseAuth.instance.currentUser!.uid;
  final uuid = Uuid();
  get id => uuid.v1();
  Set get set => {};

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // firebasefirestore instance is used to fetch the data from the collections with streamBuilder widget that updates the data in real time
      stream: FirebaseFirestore.instance.collection('engageUsers').doc(uid).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: ProfileView(
              name: snapshot.data!['name'],
              designation: snapshot.data!['department'],
              bio: snapshot.data!['bio'],
              mobileNo: snapshot.data!['mobileNo'].toString(),
              email: snapshot.data!['email'],
              dob: snapshot.data!['dob'],
              joinedDate: snapshot.data!['dob'],
              department: snapshot.data!['department'],
              profile: snapshot.data!['avatar'],
              postData: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("engagePost").where('uid', isEqualTo: uid).snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    // The Grid View Widget's Show the images uploded by the user
                    return GridView.count(
                        crossAxisCount: 3,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                        children: snapshot.data!.docs.map<Widget>((document) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [BoxShadow(offset: Offset.zero, blurRadius: 10.0, spreadRadius: 10.0, color: Color.fromARGB(19, 199, 199, 199))],
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: GestureDetector(
                              // Passing data into FullPostView Page to asscess the post into the full view
                              onTap: () {
                                Get.to(
                                  EngageFullPostView(
                                    set,
                                    postId: document['id'],
                                  ),
                                  transition: Transition.rightToLeft,
                                  duration: const Duration(milliseconds: 500),
                                );
                              },
                              child: Image.network(
                                document['post'],
                                width: Get.size.width,
                                height: Get.size.height,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }).toList());
                  }),
            ));
      },
    );
  }
}
