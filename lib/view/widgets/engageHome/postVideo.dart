import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class EngagePost extends StatelessWidget {
  final String profile;
  final String image;
  final String name;
  final String designation;
  final String description;

  const EngagePost({
    super.key,
    required this.image,
    required this.name,
    required this.designation,
    required this.description,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    Future<bool> onLikeButtonTapped(bool isLiked) async {
      return !isLiked;
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.background),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
              blurRadius: 0,
              color: Theme.of(context).colorScheme.background,
              offset: const Offset(10, 1),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Theme.of(context).colorScheme.background,
                      offset: const Offset(0, 10),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0,
                    color: Color(0xFFF1F4F8),
                    offset: Offset(0, 1),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    GestureDetector(
                      onTap: (() {
                        Get.offAll('home');
                      }),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                profile,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(12, 4, 0, 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                                    child: Text(name, style: Theme.of(context).textTheme.subtitle1),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        designation,
                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                        child: Text(
                                          '•',
                                          style: Theme.of(context).textTheme.bodyText1,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                        child: Text(
                                          '4 mins ago',
                                          style: Theme.of(context).textTheme.bodyText1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 6, 12, 10),
                      child: Text(description, textAlign: TextAlign.left, style: Theme.of(context).textTheme.bodyText1),
                    ),
                    GestureDetector(
                      onDoubleTap: () => print("This photo is geetting liked"),
                      child: Image.asset(
                        image,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 4, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                likeCount: 0,
                                onTap: onLikeButtonTapped,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(30, 14),
                                  alignment: Alignment.centerLeft,
                                ),
                                onPressed: () {
                                  // Navigator.of(context).push(_likeRoute());
                                },
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                            child: GestureDetector(
                                // onTap: () {
                                //   Navigator.of(context).push(_createRoute());
                                // },
                                child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.chat_bubble_outline, size: 20, color: Colors.grey),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "18",
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
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.more_vert),
                                  color: Colors.grey,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
