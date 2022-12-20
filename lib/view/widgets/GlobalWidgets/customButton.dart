import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EngageButton extends StatelessWidget {
  final IconData btnIcon;
  final String btnTitle;
  final void Function()? onPressed;
  final Size size;
  final Color backgroundColor;
  final TextStyle style;

  EngageButton({
    Key? key,
    required this.btnIcon,
    required this.btnTitle,
    required this.onPressed,
    required this.size,
    required this.backgroundColor,
    required this.style,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(
        btnIcon,
        size: 16,
       
      ),
      label: Text(
        btnTitle,
        style: style,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return backgroundColor;
          }
          return backgroundColor;
        }),
        fixedSize: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return size;
          }
          return size;
        }),
        elevation: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return 4.0;
          }
          return 10.0;
        }),
        shadowColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.white;
          }
          return Color.fromARGB(122, 224, 224, 224);
        }),
      ),
      onPressed: onPressed,
    );
  }
}
