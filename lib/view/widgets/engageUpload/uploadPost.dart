import 'dart:io';

import 'package:engage/controller/post_controller.dart';
import 'package:engage/view/widgets/GlobalWidgets/profileListType.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../GlobalWidgets/textInput.dart';

class EngageUploadPost extends StatefulWidget {
  const EngageUploadPost({
    super.key,
  });

  @override
  State<EngageUploadPost> createState() => _EngageUploadPostState();
}

class _EngageUploadPostState extends State<EngageUploadPost> {
  TextEditingController _addPostTitle = new TextEditingController();
  TextEditingController _postDescription = new TextEditingController();
  UploadPostController uploadPostController = Get.put(UploadPostController());

  Future imgFromGallery() async {
    final pickedFile = await uploadPostController.picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        uploadPostController.photo = File(pickedFile.path);
        uploadPostController.uploadFile();
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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                profileListType(),
                uploadPostController.photo != null
                    ? Container(
                        width: MediaQuery.of(context).size.width,
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
                    : Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        height: 320,
                        color: Get.theme.colorScheme.background,
                        child: Center(
                          child: IconButton(
                              onPressed: () {
                                imgFromGallery();
                              },
                              icon: Icon(
                                Icons.camera_alt_rounded,
                                color: Get.theme.colorScheme.primary,
                              )),
                        ),
                      ),
                EngageTextInput(controller: _addPostTitle, myIcon: Icons.post_add, myLabelText: "Enter Post Title"),
                EngageTextInput(controller: _addPostTitle, myIcon: Icons.add, myLabelText: "Enter Post Description"),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  uploadEngagePost();
                },
                child: Text("Upload"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
