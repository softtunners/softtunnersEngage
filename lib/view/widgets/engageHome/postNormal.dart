import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/controller/auth_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// This is the Post Widget that display user name, uploded post, likes and so on. this widget will be used in te main home page

class EngagePostOne extends StatefulWidget {
  final String profile;
  final String image;
  final String name;
  final String designation;
  final String description;
  final String timestamp;
  final void Function()? onPressed;
  final void Function()? onTap;
  final likes;
  final int comment;
  final String id;

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
    this.onTap,
    required this.id,
  });

  @override
  State<EngagePostOne> createState() => _EngagePostOneState();
}

class _EngagePostOneState extends State<EngagePostOne> with SingleTickerProviderStateMixin {
// Like Button Functionality
  bool _isLiked = true;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<dynamic> toogleLike(String id) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection("engagePost").doc(id).get();
    var uid = AuthController.instance.user.uid;
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked && (doc.data() as dynamic)['likes'].contains(uid)) {
        _animationController.forward();
        FirebaseFirestore.instance.collection("engagePost").doc(id).update({
          'likes': FieldValue.arrayRemove([uid]),
        });
      } else {
        _animationController.reverse();
        FirebaseFirestore.instance.collection("engagePost").doc(id).update({
          "likes": FieldValue.arrayUnion(
            [uid],
          )
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
      width: Get.size.width,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 20, 10),
              decoration: BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 243, 243, 243), width: 1, style: BorderStyle.solid, strokeAlign: StrokeAlign.inside)),
              child: Row(
                children: [
                  // Header Part of the Post that contains name, avatar, designation & timestamp
                  CircleAvatar(backgroundImage: NetworkImage(widget.profile), radius: 20),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name, style: GoogleFonts.poppins(textStyle: Get.theme.textTheme.subtitle2)),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Text(widget.designation, style: GoogleFonts.poppins(textStyle: Get.theme.textTheme.bodyText2)),
                          Container(
                              margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(color: const Color.fromARGB(255, 175, 175, 175), borderRadius: BorderRadius.circular(5))),
                          Text(widget.timestamp, style: GoogleFonts.poppins(textStyle: Get.theme.textTheme.bodyText2)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // The container contaiins the description of the post
          Visibility(
            // Visibility is used to hide Empty space from the Container
            visible: widget.description != null && widget.description.isNotEmpty,
            child: Container(
              alignment: Alignment.topLeft,
              width: Get.size.width,
              height: null,
              padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 20, 5),
              child: Text(widget.description, style: GoogleFonts.poppins(textStyle: const TextStyle(color: Color.fromARGB(183, 0, 0, 0), fontSize: 14, fontWeight: FontWeight.w400))),
            ),
          ),
          // The Container conatins the Image to display on the main page
          GestureDetector(
            onTap: widget.onTap,
            child: Image.network(widget.image),
          ),
          // The Below Container hold Like and Comment button
          Container(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 20, 10),
            child: Row(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        toogleLike(widget.id);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 5000),
                              curve: Curves.bounceIn,
                              child: Icon(
                                _isLiked ? Icons.favorite_border : Icons.favorite,
                                color: _isLiked ? Colors.grey : Colors.red,
                                size: 25,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${widget.likes}  Likes',
                            style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.grey, fontSize: 12)),
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
                        const Icon(Icons.chat_bubble_outline, size: 20, color: Colors.grey),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            '${widget.comment}  Comments',
                            style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.grey, fontSize: 12)),
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
