import 'dart:io';

import 'package:engage/controller/auth_controller.dart';
import 'package:engage/view/utils/routes.dart';
import 'package:engage/view/widgets/bottombar.dart';
import 'package:engage/view/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthController authController = Get.put(AuthController());

  int pageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Idealake Engage',
          style: GoogleFonts.poppins(textStyle: Get.theme.textTheme.headline3),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_a_photo_rounded),
          ),
          IconButton(
            onPressed: () {
              showDialog(context: context, builder: ((context) => logoutDialog()));
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            pageIdx = index;
          });
        },
        currentIndex: pageIdx,
        backgroundColor: Get.theme.colorScheme.onPrimary,
        selectedItemColor: Get.theme.colorScheme.primary,
        unselectedItemColor: Get.theme.colorScheme.tertiary,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: bottomItems,
      ),
      body: pageindex[pageIdx],
    );
  }
}

logoutDialog() {
  return AlertDialog(
    title: Text('Log Out'),
    content: Text('Are you sure you want to logout from the Idealake Engage'),
    actions: [
      TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text("Close"),
      ),
      TextButton(
          onPressed: () {
            authController.signOutUser();
          },
          child: Text('Log Out')),
    ],
  );
}
