import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage/controller/postlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class EngagePostOne extends StatefulWidget {
  final String profile;
  final String image;
  final String name;
  final String designation;
  final String description;
  final String timestamp;
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
  void initState() {
    super.initState();

    if (widget.description.length > 100) {
      firstHalf = widget.description.substring(0, 100);
      secondHalf = widget.description.substring(100, widget.description.length);
    } else {
      firstHalf = widget.description;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    // final fireLiked = FirebaseFirestore.instance.collection("engagePost").snapshots();

    Future<bool> onLikeButtonTapped(bool isLiked) async {
      return !isLiked;
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Colors.white),
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 20, 10),
              decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color.fromARGB(255, 243, 243, 243), width: 1, style: BorderStyle.solid, strokeAlign: StrokeAlign.inside))),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.profile),
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
                        style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 66, 66, 66), fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Text(widget.designation),
                          Container(
                            margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(color: Color.fromARGB(255, 175, 175, 175), borderRadius: BorderRadius.circular(5)),
                          ),
                          Text(widget.timestamp),
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
            // padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color.fromARGB(255, 243, 243, 243), width: 1, style: BorderStyle.solid, strokeAlign: StrokeAlign.inside))),
            child: secondHalf.isEmpty
                ? Text(firstHalf)
                : Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        child: flag
                            ? Stack(
                                children: [
                                  Text(
                                    firstHalf + "...",
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                  Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: InkWell(
                                        child: Text(
                                          flag ? "show more" : "show less",
                                        ),
                                        onTap: () => setState(() {
                                          flag = !flag;
                                        }),
                                      )),
                                ],
                              )
                            : Stack(
                                children: [
                                  Text(
                                    firstHalf + secondHalf,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                  Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: InkWell(
                                        child: Text(flag ? "show more" : "show less"),
                                        onTap: () => setState(() {
                                          flag = !flag;
                                        }),
                                      )),
                                ],
                              ),
                      ),
                    ],
                  ),
          ),
          GestureDetector(
            child: Container(
              child: Image.network(widget.image),
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 20, 10),
            decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromARGB(255, 243, 243, 243), width: 1, style: BorderStyle.solid, strokeAlign: StrokeAlign.inside))),
            child: Row(
              children: [
                Row(
                  children: [
                    LikeButton(
                      size: 24,
                      circleColor: const CircleColor(start: Color.fromARGB(255, 255, 0, 34), end: Color.fromARGB(255, 204, 24, 0)),
                      bubblesColor: const BubblesColor(
                        dotPrimaryColor: Color.fromARGB(255, 230, 65, 15),
                        dotSecondaryColor: Color.fromARGB(255, 204, 0, 0),
                      ),
                      likeBuilder: (bool isLiked) {
                        return isLiked
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 24,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.grey,
                                size: 24,
                              );
                      },
                      likeCount: widget.likes,
                      onTap: onLikeButtonTapped,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(30, 14),
                        alignment: Alignment.centerLeft,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Likes",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontFamily: "Outfit",
                        ),
                      ),
                    ),
                  ],
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
                            widget.comment.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontFamily: "Outfit",
                            ),
                          ),
                        ),
                        Text(
                          "Comment",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: "Outfit",
                          ),
                        )
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
