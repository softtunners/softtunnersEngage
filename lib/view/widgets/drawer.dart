import 'package:engage/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final AuthController authController = Get.put(AuthController());

var drawerItem = Container(
  height: 130,
  width: Get.size.width,
  color: Colors.white,
  child: Stack(
    children: [
      Container(
        height: 80,
        color: Get.theme.colorScheme.primary,
      ),
      Positioned(
        bottom: 0,
        left: 15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              child: CircleAvatar(
                radius: 38,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ashwin Sevak', style: Get.theme.textTheme.subtitle1),
                const SizedBox(height: 3),
                Text('Head of Mobile & Products', style: Get.theme.textTheme.bodyText1),
                const SizedBox(height: 5),
              ],
            )
          ],
        ),
      ),
    ],
  ),
);
