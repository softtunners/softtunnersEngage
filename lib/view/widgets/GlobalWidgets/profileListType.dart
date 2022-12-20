import 'package:engage/controller/profile_controller.dart';
import 'package:engage/modal/profileModal.dart';
import 'package:engage/view/screens/engageUserProfile.dart';
import 'package:engage/view/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EngageUserWidget extends StatelessWidget {
  final String name;
  final String designation;
  final String avatar;
  final dynamic data;

  EngageUserWidget({super.key, required this.name, required this.designation, required this.avatar, this.data});

  ProfileUpdateController profileUpdateController = Get.put(ProfileUpdateController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('this is page');
        Get.to(() => '');
        // profileUpdateController.showUser();
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
              backgroundImage: NetworkImage(avatar),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    textStyle: Get.theme.textTheme.subtitle1,
                  ),
                ),
                Text(
                  designation,
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
  }
}

profileListType() {
  return GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/images/user.png"),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ashwin Sevak",
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  textStyle: Get.theme.textTheme.subtitle1,
                ),
              ),
              Text(
                "Head of Mobile & Products",
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
}
