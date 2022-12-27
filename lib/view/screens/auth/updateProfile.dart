import 'dart:io';

import 'package:engage/controller/profile_controller.dart';
import 'package:engage/view/screens/engageHome.dart';
import 'package:engage/view/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class EngageFirstUpdate extends StatefulWidget {
  const EngageFirstUpdate({super.key});

  @override
  State<EngageFirstUpdate> createState() => _EngageFirstUpdateState();
}

class _EngageFirstUpdateState extends State<EngageFirstUpdate> {
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
        // profileUpdateController.uploadAvatar();
      } else {
        print('No image selected.');
      }
    });
  }

  String departmentValues = 'Select Department';

  var items = ['Front-End Technology', 'Back-End', 'Mobile', 'Accounts', 'Human Resource', 'Other'];

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
        leading: Icon(
          Icons.back_hand,
          color: Get.theme.colorScheme.primary,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.off(() => HomeScreen());
              },
              icon: Icon(Icons.close))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text('Idealakers List', style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 22, fontWeight: FontWeight.w400))),
                    const SizedBox(height: 10),
                    Text('Before procedding ahead kindly update your profile information.',
                        style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 14, fontWeight: FontWeight.w400)), textAlign: TextAlign.start),
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
                                    ? Image.file(profileUpdateController.photo!, height: Get.size.height, width: Get.size.width, fit: BoxFit.cover)
                                    : Image.asset('assets/images/user.png', height: Get.size.height, width: Get.size.width, fit: BoxFit.cover))),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                              height: 50,
                              width: 50,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                              child: InkWell(
                                  onTap: () {
                                    imgFromGallery();
                                  },
                                  child: Icon(Icons.add_a_photo, size: 24, color: Get.theme.colorScheme.primary))),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _designation,
                      decoration: InputDecoration(
                        labelText: 'Enter Your Designation',
                        labelStyle: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 14, fontWeight: FontWeight.w400)),
                        filled: true,
                        fillColor: const Color(0xFFECF8FF),
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      ),
                      style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _bio,
                      maxLines: null,
                      maxLength: 150,
                      decoration: InputDecoration(
                        labelText: 'Enter Your Bio',
                        labelStyle: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 14, fontWeight: FontWeight.w400)),
                        filled: true,
                        fillColor: const Color(0xFFECF8FF),
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      ),
                      style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _mobileNo,
                      keyboardType: const TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        labelText: 'Enter Your Mobile',
                        labelStyle: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 14, fontWeight: FontWeight.w400)),
                        filled: true,
                        fillColor: const Color(0xFFECF8FF),
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      ),
                      style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _dob,
                      readOnly: true,
                      // While on click user will have to select his Date of Birth
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print('Selected Date ${pickedDate}');
                          pickedDate.toString();
                          setState(() {
                            _dob.text = '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                          });
                        }
                      },
                      decoration: InputDecoration(
                        label: const Text('Enter Your Date of Birth'),
                        labelStyle: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 14, fontWeight: FontWeight.w400)),
                        filled: true,
                        fillColor: const Color(0xFFECF8FF),
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      ),
                      style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _department,
                      decoration: InputDecoration(
                        labelText: 'Enter Your Department',
                        labelStyle: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 14, fontWeight: FontWeight.w400)),
                        filled: true,
                        fillColor: const Color(0xFFECF8FF),
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      ),
                      style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        updatePost();
                        Future.delayed(const Duration(seconds: 3), (() {
                          Get.to(() => HomeScreen());
                        }));
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
