import 'dart:io';

import 'package:engage/controller/post_controller.dart';
import 'package:engage/view/widgets/GlobalWidgets/customButton.dart';
import 'package:engage/view/widgets/GlobalWidgets/profileListType.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class EngageUploadPostSec extends StatefulWidget {
  EngageUploadPostSec({super.key});

  @override
  State<EngageUploadPostSec> createState() => _EngageUploadPostSecState();
}

class _EngageUploadPostSecState extends State<EngageUploadPostSec> {
  bool uploadingPost = false;

  TextEditingController _postDescription = new TextEditingController();

  UploadPostController uploadPostController = Get.put(UploadPostController());

  Future imgFromGallery(ImageSource imagePlatform) async {
    final pickedFile = await uploadPostController.picker.pickImage(source: imagePlatform);

    setState(() {
      if (pickedFile != null) {
        uploadPostController.photo = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  uploadEngagePost() {
    uploadPostController.uploadPost(_postDescription.text, uploadPostController.photo!);
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
    _postDescription = new TextEditingController();
  }

  @override
  void dispose() {
    _postDescription.dispose();
    uploadPostController.photo = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height,
      width: Get.size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              children: [
                EngageUserWidget(),
                TextFormField(
                  controller: _postDescription,
                  maxLines: null,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsetsDirectional.fromSTEB(15, 10, 10, 15),
                    hintText: "What's on your mind today, Idealaker",
                  ),
                  style: GoogleFonts.poppins(textStyle: Get.textTheme.subtitle2),
                ),
                uploadPostController.photo != null
                    ? Container(
                        height: 320,
                        width: Get.size.width,
                        color: Get.theme.colorScheme.background,
                        child: uploadingPost
                            ? Center(child: CircularProgressIndicator())
                            : Stack(children: [
                                Image.file(
                                  uploadPostController.photo!,
                                  fit: BoxFit.contain,
                                ),
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
          ),
          Container(
              child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: Get.size.width / 3,
                    padding: const EdgeInsets.fromLTRB(10, 10, 05, 10),
                    child: EngageButton(
                      btnIcon: Icons.photo,
                      btnTitle: 'Gallery',
                      onPressed: () {
                        imgFromGallery(ImageSource.gallery);
                      },
                      size: Size(80, 20),
                      backgroundColor: Colors.white,
                      style: GoogleFonts.poppins(textStyle: Get.textTheme.bodyText2),
                    ),
                  ),
                  Container(
                    width: Get.size.width / 3,
                    padding: const EdgeInsets.fromLTRB(5, 10, 05, 10),
                    child: EngageButton(
                      btnIcon: Icons.camera,
                      btnTitle: 'Camera',
                      onPressed: () {
                        imgFromGallery(ImageSource.camera);
                      },
                      size: Size(80, 20),
                      backgroundColor: Colors.white,
                      style: GoogleFonts.poppins(textStyle: Get.textTheme.bodyText2),
                    ),
                  ),
                  Container(
                    width: Get.size.width / 3,
                    padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
                    child: EngageButton(
                      btnIcon: Icons.link,
                      btnTitle: 'Attachment',
                      onPressed: () {},
                      size: Size(80, 20),
                      backgroundColor: Colors.white,
                      style: GoogleFonts.poppins(textStyle: Get.textTheme.bodyText2),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                child: ElevatedButton(
                  onPressed: () {
                    uploadEngagePost();
                    setState(() {
                      uploadingPost = !uploadingPost;
                    });
                    Future.delayed(Duration(seconds: 4), () {
                      setState(() {
                        uploadingPost = false;
                      });
                    });
                  },
                  child: Text("Upload"),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
