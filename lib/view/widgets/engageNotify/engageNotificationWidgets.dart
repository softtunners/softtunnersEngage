import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// Engage Notification Screen

class EngageNotifications extends StatelessWidget {
  final String count;

  const EngageNotifications({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // The Container Display the Date wise Notifictaions
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Engage Notifications', style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 20, fontWeight: FontWeight.w400))),
            const SizedBox(height: 10),
            Text("Your Notification has been stacked up here, check who have commented, liked or shared posts with you",
                style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 14, fontWeight: FontWeight.w400))),
            EngageNotifyState(
              date: '18, August, 2022',
              notTitle: 'Likes Notification',
              noteSubTitle: 'Your recently added poast has been liked by ${count} Idealakers',
              image: 'assets/images/profile3.jpg',
            ),
            EngageNotifyState(
              date: '20, August, 2022',
              notTitle: 'Likes Notification',
              noteSubTitle: 'Your recently added poast has been liked by ${count} Idealakers',
              image: 'assets/images/profile1.jpg',
            ),
            EngageNotifyState(
              date: '17, September, 2022',
              notTitle: 'Likes Notification',
              noteSubTitle: 'Your recently added poast has been liked by ${count} Idealakers',
              image: 'assets/images/space.jpg',
            ),
            EngageNotifyState(
              date: '27, December, 2022',
              notTitle: 'Likes Notification',
              noteSubTitle: 'Your recently added poast has been liked by ${count} Idealakers',
              image: 'assets/images/profile4.jpg',
            )
          ],
        ),
      ),
    );
  }
}

// Custom Widget for Likes and Comments Notification

class EngageNotifyState extends StatelessWidget {
  final String date;
  final String notTitle;
  final String noteSubTitle;
  final String image;

  const EngageNotifyState({
    super.key,
    required this.date,
    required this.notTitle,
    required this.noteSubTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(date, style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 14, fontWeight: FontWeight.w400))),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Column(
            children: [
              Container(
                width: Get.size.width,
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [BoxShadow(offset: Offset.zero, blurRadius: 1.0, spreadRadius: 1.0, color: Color.fromARGB(19, 199, 199, 199), blurStyle: BlurStyle.inner)],
                ),
                child: Row(
                  children: [
                    Container(
                      width: Get.size.width - 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notTitle, style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 15, fontWeight: FontWeight.w400))),
                          Text(noteSubTitle, style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 13, fontWeight: FontWeight.w400))),
                        ],
                      ),
                    ),
                    Container(
                      width: 60,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                      height: 60,
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
