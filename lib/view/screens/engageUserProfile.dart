import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/controller/users_controllers.dart';
import 'package:engage/view/screens/engagePostView.dart';
import 'package:engage/view/widgets/engageProfile/userProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EngageProfileOfUser extends StatefulWidget {
  final dynamic userData;
  EngageProfileOfUser(
    Set set, {
    super.key,
    required this.userData,
  });

  @override
  State<EngageProfileOfUser> createState() => _EngageProfileOfUserState();
}

class _EngageProfileOfUserState extends State<EngageProfileOfUser> {
  TextEditingController _search = new TextEditingController();

  EngageUsersFire engageUsersFire = Get.put(EngageUsersFire());

  static String? get uid => FirebaseAuth.instance.currentUser!.uid;
  Future<DocumentSnapshot<Map<String, dynamic>>> getData = FirebaseFirestore.instance.collection("engageUsers").doc(uid).get();

  get set => {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.chevron_left, color: Colors.white)),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('engageUsers').doc(widget.userData).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return UserProfile(
              name: snapshot.data!['name'],
              designation: snapshot.data!['department'],
              bio: snapshot.data!['bio'],
              mobileNo: snapshot.data!['mobileNo'].toString(),
              email: snapshot.data!['email'],
              dob: snapshot.data!['dob'],
              joinedDate: snapshot.data!['dob'],
              department: snapshot.data!['designation'],
              profile: snapshot.data!['avatar'],
              postData: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("engagePost").where('uid', isEqualTo: snapshot.data!['uid']).snapshots(),
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
                              // Fetching Image from firebase
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
            );
          }),
    );
  }
}
