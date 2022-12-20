import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';

class EngageStories extends StatelessWidget {
  const EngageStories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Stories',
            style: GoogleFonts.poppins(textStyle: Get.theme.textTheme.bodyText1),
            textAlign: TextAlign.center,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: DottedBorder(
                        strokeWidth: 2,
                        borderType: BorderType.Circle,
                        strokeCap: StrokeCap.round,
                        dashPattern: [5, 5],
                        radius: const Radius.circular(12),
                        color: Get.theme.colorScheme.primary,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromARGB(38, 78, 228, 255),
                          ),
                          height: double.infinity,
                          child: Icon(Icons.add, color: Get.theme.colorScheme.primary),
                        ),
                      ),
                    ),
                    Text(
                      'Share Story',
                      style: GoogleFonts.poppins(textStyle: Get.theme.textTheme.bodyText2),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    StoryCard(
                      image: 'assets/images/post3.jpeg',
                      name: 'Ashwin Sevak',
                    ),
                    StoryCard(
                      image: 'assets/images/post4.jpeg',
                      name: 'Ajinkaya Pandit',
                    ),
                    StoryCard(
                      image: 'assets/images/post5.jpeg',
                      name: 'Prachi Jain',
                    ),
                    StoryCard(
                      image: 'assets/images/post2.jpg',
                      name: 'Sanjivani Mahadik',
                    ),
                    StoryCard(
                      image: 'assets/images/profile1.jpg',
                      name: 'Vajidullah Khan',
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final String image;
  final String name;
  const StoryCard({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            padding: const EdgeInsets.all(1),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(style: BorderStyle.solid, strokeAlign: StrokeAlign.center, width: 2, color: Get.theme.colorScheme.primary)),
            child: Center(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(38, 78, 228, 255),
                    image: DecorationImage(
                        image: AssetImage(
                          image,
                        ),
                        fit: BoxFit.cover)),
                height: double.infinity,
              ),
            ),
          ),
          Text(
            name,
            style: GoogleFonts.poppins(textStyle: Get.theme.textTheme.bodyText2),
          ),
        ],
      ),
    );
    ;
  }
}
