import 'dart:io';

import 'package:engage/controller/post_controller.dart';
import 'package:engage/view/widgets/GlobalWidgets/profileListType.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../GlobalWidgets/textInput.dart';

class EngageUploadPostSec extends StatefulWidget {
  const EngageUploadPostSec({
    super.key,
  });

  @override
  State<EngageUploadPostSec> createState() => _EngageUploadPostSecState();
}

class _EngageUploadPostSecState extends State<EngageUploadPostSec> {
  TextEditingController _addPostTitle = new TextEditingController();
  TextEditingController _postDescription = new TextEditingController();
  UploadPostController uploadPostController = Get.put(UploadPostController());

  Future imgFromGallery() async {
    final pickedFile = await uploadPostController.picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        uploadPostController.photo = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  uploadEngagePost() {
    uploadPostController.uploadPost(_addPostTitle.text, uploadPostController.photo!, _postDescription.text);
  }

  pickedImage() {
    final imageTemperory = uploadPostController.photo!;
    setState(() {
      uploadPostController.photo = imageTemperory;
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
    uploadPostController.photo = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: Get.size.height - 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                profileListType(),
                EngageTextInput(
                  controller: _addPostTitle,
                  myLabelText: "What's on your mind, Ashwin Sevak",
                  myIcon: Icons.note,
                ),
                uploadPostController.photo != null
                    ? Container(
                        width: Get.size.width,
                        color: Get.theme.colorScheme.background,
                        child: Stack(children: [
                          Image.file(uploadPostController.photo!),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              icon: const Icon(
                                Icons.close,
                                size: 25,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  uploadPostController.photo = null;
                                });
                              },
                            ),
                          ),
                        ]),
                      )
                    : Container(),
              ],
            ),
            const Positioned(child: ButtonBar()),
            IconButton(
              onPressed: () {
                imgFromGallery();
              },
              icon: Icon(
                Icons.camera_alt_rounded,
                color: Get.theme.colorScheme.primary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  uploadEngagePost();
                },
                child: const Text("Upload"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
