import 'package:engage/controller/auth_controller.dart';
import 'package:engage/view/utils/routes.dart';
import 'package:engage/view/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      ),
      drawer: Drawer(
        child: ListView(children: [
          ListTile(
            onTap: () {
              authController.signOutUser();
            },
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
        ]),
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
