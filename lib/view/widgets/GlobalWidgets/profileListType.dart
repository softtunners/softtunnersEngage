import 'package:engage/view/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EngageUserWidget extends StatelessWidget {
  final String name;
  final String designation;
  final String avatar;

  const EngageUserWidget({super.key, required this.name, required this.designation, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, EngageRoutes.userProfile);
      },
      splashColor: Get.theme.colorScheme.background,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              backgroundImage: AssetImage(avatar),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  textAlign: TextAlign.left,
                  style: Get.theme.textTheme.subtitle1,
                ),
                Text(
                  designation,
                  style: Get.theme.textTheme.bodyText1,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

profileListType() {
  return GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/profile2.jpg"),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Prachi Jain",
                textAlign: TextAlign.left,
                style: Get.theme.textTheme.subtitle1,
              ),
              Text(
                "Head of Mobile & Products",
                style: Get.theme.textTheme.bodyText1,
              )
            ],
          )
        ],
      ),
    ),
  );
}
