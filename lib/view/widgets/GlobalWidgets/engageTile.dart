import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EngageTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const EngageTile({super.key, required this.title, required this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [BoxShadow(offset: Offset.zero, blurRadius: 10.0, spreadRadius: 10.0, color: Color.fromARGB(19, 199, 199, 199))],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            icon,
            color: Get.theme.colorScheme.primary,
            size: 20,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 12, fontWeight: FontWeight.w400))),
              Text(subtitle, style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 13, fontWeight: FontWeight.w400))),
            ],
          )
        ],
      ),
    );
  }
}
