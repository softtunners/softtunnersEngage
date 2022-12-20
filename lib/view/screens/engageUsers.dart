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

class EngageUsers extends StatefulWidget {
  EngageUsers({super.key});

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
    return StreamBuilder(
      stream: streamLink,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: snapshot.data!.docs.map<Widget>((document) {
            return InkWell(
              onTap: () {
                print(' this is uid ' + document['uid']);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => EngageProfileOfUser(
                              set,
                              userData: document['uid'],
                            ))));
              },
              splashColor: Get.theme.colorScheme.background,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Color.fromARGB(121, 236, 236, 236), offset: Offset.zero, spreadRadius: 4.0, blurRadius: 4.0, blurStyle: BlurStyle.normal)],
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      backgroundImage: NetworkImage(document['avatar']),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          document['name'],
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            textStyle: Get.theme.textTheme.subtitle1,
                          ),
                        ),
                        Text(
                          document['designation'],
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
          }).toList(),
        );
      },
    );
  }
}
