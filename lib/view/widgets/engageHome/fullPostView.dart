import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comment_tree/comment_tree.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:engage/controller/auth_controller.dart';
import 'package:engage/controller/postlist_controller.dart';
import 'package:engage/view/screens/engagePostView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class FullPostView extends StatefulWidget {
  final String profile;
  final String image;
  final String name;
  final String designation;
  final String description;
  final String timestamp;
  final void Function()? onPressed;
  final likes;

  final int comment;

  const FullPostView({
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
  State<FullPostView> createState() => _FullPostViewState();
}

class _FullPostViewState extends State<FullPostView> {
  final EngagePostListController engagePostList = Get.put(EngagePostListController());

  bool commented = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
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
                          child: Image.asset(widget.image),
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
                                        style: const TextStyle(
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
                      ), // Comment Widget
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  // height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(color: Get.theme.colorScheme.background, width: 1, style: BorderStyle.solid),
                          bottom: BorderSide(color: Get.theme.colorScheme.background, width: 1, style: BorderStyle.solid))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Comments Box',
                            style: GoogleFonts.poppins(textStyle: Get.theme.textTheme.subtitle2),
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ],
                  ),
                ),
                commented
                    ? Container(
                        padding: const EdgeInsets.all(20),
                        child: CommentTreeWidget<Comment, Comment>(
                          Comment(avatar: 'null', userName: 'null', content: 'felangel made felangel/cubit_and_beyond public '),
                          [
                            Comment(avatar: 'null', userName: 'null', content: 'A Dart template generator which helps teams'),
                          ],
                          treeThemeData: TreeThemeData(lineColor: Color.fromARGB(0, 255, 255, 255)!, lineWidth: 3),
                          avatarRoot: (context, data) => const PreferredSize(
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.grey,
                              backgroundImage: AssetImage('assets/images/post2.jpg'),
                            ),
                            preferredSize: Size.fromRadius(18),
                          ),
                          avatarChild: (context, data) => PreferredSize(
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.grey,
                              backgroundImage: AssetImage('assets/images/post2.jpg'),
                            ),
                            preferredSize: Size.fromRadius(12),
                          ),
                          contentChild: (context, data) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                  decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ashwin Sevak',
                                        style: Theme.of(context).textTheme.caption?.copyWith(fontWeight: FontWeight.w600, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        '${data.content}',
                                        style: Theme.of(context).textTheme.caption?.copyWith(fontWeight: FontWeight.w300, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                DefaultTextStyle(
                                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey[700], fontWeight: FontWeight.bold),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 4),
                                    child: Row(
                                      children: const [
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('Like'),
                                        SizedBox(
                                          width: 24,
                                        ),
                                        Text('Reply'),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          contentRoot: (context, data) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                  decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Prachi Jain',
                                        style: Theme.of(context).textTheme.caption!.copyWith(fontWeight: FontWeight.w600, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        '${data.content}',
                                        style: Theme.of(context).textTheme.caption!.copyWith(fontWeight: FontWeight.w300, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                DefaultTextStyle(
                                  style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey[700], fontWeight: FontWeight.bold),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 4),
                                    child: Row(
                                      children: const [
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('Like'),
                                        SizedBox(
                                          width: 24,
                                        ),
                                        Text('Reply'),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      )
                    : Container(
                        height: Get.size.height / 3.5,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.comments_disabled_outlined,
                              color: Get.theme.colorScheme.primary,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('No Comments at this Moment')
                          ],
                        ))),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          height: null,
          width: Get.size.width,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Color.fromARGB(10, 34, 34, 34), blurStyle: BlurStyle.normal, offset: Offset.zero, blurRadius: 100, spreadRadius: 100)],
              border: Border(
                  top: BorderSide(color: Get.theme.colorScheme.background, width: 1, style: BorderStyle.solid),
                  bottom: BorderSide(color: Get.theme.colorScheme.background, width: 1, style: BorderStyle.solid)),
            ),
            child: TextFormField(
              maxLines: null,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                    )),
                label: Text(
                  'Write Your Comment',
                  style: GoogleFonts.poppins(textStyle: Get.theme.textTheme.subtitle2),
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                contentPadding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              ),
              style: Get.theme.textTheme.subtitle2,
            ),
          ),
        ),
      ],
    );
  }
}
