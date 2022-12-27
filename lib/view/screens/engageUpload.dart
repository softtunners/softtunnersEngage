import 'package:engage/view/widgets/engageUpload/UploadPost.dart';
import 'package:engage/view/widgets/engageUpload/UploadUI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EngageUpload extends StatefulWidget {
  const EngageUpload({super.key});

  @override
  State<EngageUpload> createState() => _EngageUploadState();
}

class _EngageUploadState extends State<EngageUpload> {
  bool screenLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        screenLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return screenLoading
        ? SizedBox(
            width: double.infinity,
            height: Get.size.height,
            child: const Center(child: CircularProgressIndicator()),
          )
        : Container(
            child: EngageUploadPostSec(),
          );
  }
}
