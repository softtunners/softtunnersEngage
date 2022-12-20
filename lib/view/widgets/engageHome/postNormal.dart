import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/controller/auth_controller.dart';
import 'package:engage/controller/postlist_controller.dart';
import 'package:engage/view/screens/engagePostView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class EngagePostOne extends StatefulWidget {
  final String profile;
  final String image;
  final String name;
  final String designation;
  final String description;
  final String timestamp;
  final void Function()? onPressed;
  final likes;

  final int comment;

  const EngagePostOne({
    super.key,
    required this.profile,
    required this.image,
    required this.name,
    required this.designation,
    required this.description,
    required this.timestamp,
    required this.likes,
    required this.comment,
    required this.onPressed,
  });

  @override
  State<EngagePostOne> createState() => _EngagePostOneState();
}

class _EngagePostOneState extends State<EngagePostOne> {
  final EngagePostListController engagePostList = Get.put(EngagePostListController());

  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  Widget build(BuildContext context) {
    Future<bool> onLikeButtonTapped(bool isLiked) async {
      return !isLiked;
    }

    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => const EngageFullPostView(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 1000));
            },
            child: Container(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 20, 10),
              decoration: BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 243, 243, 243), width: 1, style: BorderStyle.solid, strokeAlign: StrokeAlign.inside)),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.profile),
                    radius: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: GoogleFonts.poppins(textStyle: Get.theme.textTheme.subtitle2),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Text(
                            widget.designation,
                            style: GoogleFonts.poppins(textStyle: Get.theme.textTheme.bodyText2),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(color: const Color.fromARGB(255, 175, 175, 175), borderRadius: BorderRadius.circular(5)),
                          ),
                          Text(
                            widget.timestamp,
                            style: GoogleFonts.poppins(textStyle: Get.theme.textTheme.bodyText2),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 20, 10),
            child: Text(
              widget.description,
              style: GoogleFonts.poppins(textStyle: Get.theme.textTheme.subtitle2),
            ),
          ),
          GestureDetector(
            child: Container(
              child: Image.network(widget.image),
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 20, 10),
            child: Row(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: widget.onPressed,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/heart.gif',
                            width: 25,
                            height: 25,
                          ),
                          // const Icon(Icons.favorite, size: 20, color: Colors.redAccent),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${widget.likes}  Likes',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontFamily: "Outfit",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    GestureDetector(
                        child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.chat_bubble_outline, size: 20, color: Colors.grey),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            '${widget.comment}  Comments',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontFamily: "Outfit",
                            ),
                          ),
                        ),
                      ],
                    )),
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
