import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EngageTextInput extends StatelessWidget {
  final TextEditingController controller;
  final IconData myIcon;
  final String myLabelText;
  final bool toHide;

  EngageTextInput({Key? key, required this.controller, required this.myIcon, required this.myLabelText, this.toHide = false});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: toHide,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(myIcon),
        labelText: myLabelText,
        hintStyle: Get.theme.textTheme.bodyText1,
        enabledBorder: Get.theme.inputDecorationTheme.enabledBorder,
        focusedBorder: Get.theme.inputDecorationTheme.focusedBorder,
        errorBorder: Get.theme.inputDecorationTheme.focusedBorder,
        focusedErrorBorder: Get.theme.inputDecorationTheme.focusedErrorBorder,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      ),
      style: Get.theme.textTheme.subtitle2,
    );
  }
}
