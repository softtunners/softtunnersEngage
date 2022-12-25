import 'package:engage/view/widgets/GlobalWidgets/engageTile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatefulWidget {
  final String name;
  final String designation;
  final String bio;
  final String mobileNo;
  final String email;
  final String dob;
  final String joinedDate;
  final String department;
  final String profile;
  final Widget postData;

  const UserProfile({
    super.key,
    required this.name,
    required this.designation,
    required this.bio,
    required this.mobileNo,
    required this.email,
    required this.dob,
    required this.joinedDate,
    required this.department,
    required this.profile,
    required this.postData,
  });

  @override
  State<UserProfile> createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 230,
            width: Get.size.width,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  height: 100,
                  color: Get.theme.colorScheme.primary,
                ),
                Positioned(
                  bottom: 0,
                  left: 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // The Circle Avatar contain the profile picture of the user
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60,
                        child: CircleAvatar(
                          radius: 57,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(widget.profile),
                        ),
                      ),
                      // The below code conatins the args of Username & Designation
                      const SizedBox(height: 10),
                      Text(widget.name, style: GoogleFonts.poppins(textStyle: Get.theme.textTheme.headline4)),
                      const SizedBox(height: 3),
                      Text(widget.designation, style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 15, fontWeight: FontWeight.w400))),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // This Container holds user's personal details such as Bio, Mobile, Email, DOB, Joined Date & Department that need to be filled by the user once they logged in else the data will be shown as blank
          Container(
            margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            // padding: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255), border: Border(top: BorderSide(width: 1, color: Color.fromARGB(33, 158, 158, 158)))),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Idealaker Detail', style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 20, fontWeight: FontWeight.w400))),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      // This Text Widget Contains Bio
                      child: Text(widget.bio, style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 13, fontWeight: FontWeight.w400))),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [BoxShadow(offset: Offset.zero, blurRadius: 10.0, spreadRadius: 10.0, color: Color.fromARGB(19, 199, 199, 199))],
                  ),
                  child: Column(
                    children: [
                      EngageTile(title: 'Mobile No :', subtitle: widget.mobileNo, icon: Icons.phone_rounded),
                      EngageTile(title: 'Email Id :', subtitle: widget.email, icon: Icons.email_rounded),
                      EngageTile(title: 'Date Of Birth :', subtitle: widget.dob, icon: Icons.cake_rounded),
                      EngageTile(title: 'Joined Idealake On :', subtitle: widget.joinedDate, icon: Icons.join_full_rounded),
                      EngageTile(title: 'Department', subtitle: widget.department, icon: Icons.group),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Users Post Section Starts from here
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(color: Colors.white, border: Border(top: BorderSide(width: 1, color: Color.fromARGB(33, 158, 158, 158)))),
            width: Get.size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.name}'s Posts", style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 20, fontWeight: FontWeight.w400))),
                const SizedBox(height: 10),
                Text("idealakers love sharing happy moments, Check ${widget.name}'s updated and recent posts",
                    style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 13, fontWeight: FontWeight.w400))),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
            height: Get.size.shortestSide,
            child: widget.postData,
          ),
        ],
      ),
    );
  }
}
