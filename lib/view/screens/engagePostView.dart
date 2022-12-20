import 'package:engage/view/widgets/engageHome/fullPostView.dart';
import 'package:engage/view/widgets/engageUpload/UploadPost.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EngageFullPostView extends StatelessWidget {
  const EngageFullPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.chevron_left,
              color: Colors.white,
            )),
      ),
      body: FullPostView(
          profile: 'assets/images/space.jpg',
          image: 'assets/images/profile4.jpg',
          name: 'Ashwin Sevak',
          designation: 'Head of Mobile & Products',
          description: 'This is amazing post which is posted by ashwin sevak',
          timestamp: '17, September',
          likes: 3,
          comment: 7,
          onPressed: () {}),
    );
  }
}
