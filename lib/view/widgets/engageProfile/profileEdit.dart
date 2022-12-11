import 'dart:io';

import 'package:engage/controller/auth_controller.dart';
import 'package:engage/controller/profile_controller.dart';
import 'package:engage/view/screens/auth/engageLogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EngageProfileEdit extends StatefulWidget {
  const EngageProfileEdit({super.key});

  @override
  State<EngageProfileEdit> createState() => _EngageProfileEditState();
}

class _EngageProfileEditState extends State<EngageProfileEdit> {
  TextEditingController _username = TextEditingController();
  TextEditingController _designation = TextEditingController();
  TextEditingController _bio = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _department = TextEditingController();
  TextEditingController _mobileNo = TextEditingController();

  ProfileUpdateController profileUpdateController = Get.put(ProfileUpdateController());

  Future imgFromGallery() async {
    final pickedFile = await profileUpdateController.picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        profileUpdateController.photo = File(pickedFile.path);
        profileUpdateController.uploadAvatar();
      } else {
        print('No image selected.');
      }
    });
  }

  late bool passwordVisibility;
  final _formKey = GlobalKey<FormState>();

  updatePost() {
    ProfileUpdateController.instance.updateProfile(_designation.text, _bio.text, _dob.text, _mobileNo.hashCode, _designation.text, profileUpdateController.photo!);
  }

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _designation = TextEditingController();
    _bio = TextEditingController();
    _dob = TextEditingController();
    _department = TextEditingController();
    _mobileNo = TextEditingController();
  }

  @override
  void dispose() {
    _username.dispose();
    _designation.dispose();
    _bio.dispose();
    _dob.dispose();
    _department.dispose();
    _mobileNo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text('Edit Your Profile,', style: Get.theme.textTheme.headline2),
                    const SizedBox(height: 20),
                    Text(
                      'Idealakers can edit and delete thier personal details from here.',
                      textAlign: TextAlign.start,
                      style: Get.theme.textTheme.subtitle2,
                    ),
                    const SizedBox(height: 20),
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60,
                          child: Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                            clipBehavior: Clip.antiAlias,
                            child: profileUpdateController.photo != null
                                ? Image.file(
                                    profileUpdateController.photo!,
                                    height: Get.size.height,
                                    width: Get.size.width,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'assets/images/user.png',
                                    height: Get.size.height,
                                    width: Get.size.width,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 50,
                            width: 50,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: InkWell(
                              onTap: () {
                                imgFromGallery();
                              },
                              child: Icon(
                                Icons.add_a_photo,
                                size: 24,
                                color: Get.theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _username,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Enter Your Name',
                        labelStyle: Get.theme.textTheme.bodyText1,
                        filled: true,
                        fillColor: const Color(0xFFECF8FF),
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      ),
                      style: Get.theme.textTheme.bodyText1,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _designation,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Enter Your Designation',
                        labelStyle: Get.theme.textTheme.bodyText1,
                        filled: true,
                        fillColor: const Color(0xFFECF8FF),
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      ),
                      style: Get.theme.textTheme.bodyText1,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _bio,
                      autofocus: false,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Enter Your Bio',
                        labelStyle: Get.theme.textTheme.bodyText1,
                        filled: true,
                        fillColor: const Color(0xFFECF8FF),
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      ),
                      style: Get.theme.textTheme.bodyText1,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _mobileNo,
                      autofocus: false,
                      keyboardType: const TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        labelText: 'Enter Your Mobile',
                        labelStyle: Get.theme.textTheme.bodyText1,
                        filled: true,
                        fillColor: const Color(0xFFECF8FF),
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      ),
                      style: Get.theme.textTheme.bodyText1,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _dob,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Enter Your Date of Birth',
                        labelStyle: Get.theme.textTheme.bodyText1,
                        filled: true,
                        fillColor: const Color(0xFFECF8FF),
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      ),
                      style: Get.theme.textTheme.bodyText1,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _department,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Enter Your Department',
                        labelStyle: Get.theme.textTheme.bodyText1,
                        filled: true,
                        fillColor: const Color(0xFFECF8FF),
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      ),
                      style: Get.theme.textTheme.bodyText1,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        updatePost();
                      },
                      style: TextButton.styleFrom(padding: const EdgeInsets.all(15.0), minimumSize: const Size.fromHeight(50), backgroundColor: const Color(0xFF0B4E82)),
                      child: const Text('Register'),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
