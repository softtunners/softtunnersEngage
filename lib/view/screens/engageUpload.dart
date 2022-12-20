import 'package:engage/view/widgets/engageUpload/UploadPost.dart';
import 'package:engage/view/widgets/engageUpload/UploadUI.dart';
import 'package:flutter/material.dart';

class EngageUpload extends StatelessWidget {
  const EngageUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: EngageUploadPostSec(),
    );
  }
}
