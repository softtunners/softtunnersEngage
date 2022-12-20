import 'dart:io';

import 'package:engage/controller/post_controller.dart';
import 'package:engage/view/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  final String name;
  final String designation;
  final String bio;
  final String mobileNo;
  final String email;
  final String dob;
  final String joinedDate;
  final String department;
  final String profile;

  const ProfileView({
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
  });

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  TextEditingController _addPostTitle = new TextEditingController();
  TextEditingController _postDescription = new TextEditingController();
  UploadPostController uploadPostController = Get.put(UploadPostController());

  Future imgFromGallery() async {
    final pickedFile = await uploadPostController.picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        uploadPostController.photo = File(pickedFile.path);
        // uploadPostController.uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _addPostTitle = new TextEditingController();
    _postDescription = new TextEditingController();
  }

  @override
  void dispose() {
    _addPostTitle.dispose();
    _postDescription.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 130,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  height: 80,
                  color: Get.theme.colorScheme.primary,
                ),
                Positioned(
                  right: 20,
                  bottom: 60,
                  child: TextButton.icon(
                    onPressed: () => Navigator.pushNamed(context, EngageRoutes.userEdit),
                    icon: const Icon(
                      Icons.edit,
                      size: 16,
                    ),
                    label: const Text(
                      'Edit',
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.white;
                        }
                        return Color.fromARGB(197, 230, 230, 230);
                      }),
                      fixedSize: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Size(80, 20);
                        }
                        return Size(80, 20);
                      }),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60,
                        child: CircleAvatar(
                          radius: 58,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(widget.profile),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name, style: Get.theme.textTheme.subtitle1),
                          const SizedBox(height: 3),
                          Text('Head of Mobile & Products', style: Get.theme.textTheme.bodyText1),
                          const SizedBox(height: 5),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(color: Color.fromARGB(24, 214, 214, 214), borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Employee Details',
                      style: Get.theme.textTheme.bodyText1,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        widget.bio,
                        style: Get.theme.textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.phone,
                      color: Get.theme.colorScheme.primary,
                      size: 14,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Mobile No : ${widget.mobileNo}',
                      style: Get.theme.textTheme.bodyText2,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.email,
                      color: Get.theme.colorScheme.primary,
                      size: 14,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Email Id :' + widget.email,
                      style: Get.theme.textTheme.bodyText2,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.cake,
                      color: Get.theme.colorScheme.primary,
                      size: 14,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Date of Birth :' + widget.dob,
                      style: Get.theme.textTheme.bodyText2,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.local_activity,
                      color: Get.theme.colorScheme.primary,
                      size: 14,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Joined Idealake on :' + widget.joinedDate,
                      style: Get.theme.textTheme.bodyText2,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.group,
                      color: Get.theme.colorScheme.primary,
                      size: 14,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Department :' + widget.department,
                      style: Get.theme.textTheme.bodyText2,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                  color: Color.fromARGB(255, 230, 230, 230),
                  width: 1,
                ))),
            width: Get.size.width,
            height: MediaQuery.of(context).size.height,
            child: GridView.count(
              crossAxisCount: 3,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              children: [
                Image.asset(
                  'assets/images/post3.jpeg',
                  width: Get.size.width,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/post3.jpeg',
                  width: Get.size.width,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/post3.jpeg',
                  width: Get.size.width,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/post3.jpeg',
                  width: Get.size.width,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/post3.jpeg',
                  width: Get.size.width,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/post3.jpeg',
                  width: Get.size.width,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/post3.jpeg',
                  width: Get.size.width,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/post3.jpeg',
                  width: Get.size.width,
                  fit: BoxFit.cover,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
