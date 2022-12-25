import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/controller/users_controllers.dart';
import 'package:engage/view/screens/engageUserProfile.dart';
import 'package:engage/view/widgets/GlobalWidgets/profileListType.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// This page displays all the registered users from this page any user can also view other User's profile.

class EngageUsers extends StatefulWidget {
  const EngageUsers({super.key});

  @override
  State<EngageUsers> createState() => _EngageUsersState();
}

class _EngageUsersState extends State<EngageUsers> {
  TextEditingController _search = new TextEditingController();

  EngageUsersFire engageUsersFire = Get.put(EngageUsersFire());

  Set get set => {};

  @override
  Widget build(BuildContext context) {
    final streamLink = FirebaseFirestore.instance.collection("engageUsers").orderBy('name', descending: false).snapshots();
    // Fetching data of registered Users
    return StreamBuilder(
      stream: streamLink,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container(
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Screen Information
            Text('Idealakers List', style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 20, fontWeight: FontWeight.w400))),
            const SizedBox(height: 10),
            Text("List of the user's who have registered into the Idealake Engage",
                style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 14, fontWeight: FontWeight.w400))),
            SizedBox(height: 10),
            Column(
              children: snapshot.data!.docs.map<Widget>((document) {
                return EngageIdeaUsers(
                    avatar: document['avatar'],
                    name: document['name'],
                    designation: document['designation'],
                    onTap: () {
                      // while tapping here this will pass the uid into the EngageProfileUser's Page so that user can see idealakers full profiles
                      Get.to(EngageProfileOfUser(set, userData: document['uid']), duration: const Duration(milliseconds: 500), transition: Transition.rightToLeft);
                    });
              }).toList(),
            )
          ]),
        );
      },
    );
  }
}
