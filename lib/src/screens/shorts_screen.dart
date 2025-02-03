import 'package:flutter/material.dart';
import 'package:project/src/assets/icons.dart';
import 'package:project/src/components/bottom_bar.dart';
import 'package:project/src/utils/scale.dart';

class ShortsScreen extends StatelessWidget {
  final List<String> reels = [
    AppIcons.reel,
    AppIcons.reel2,
    AppIcons.reel4,
    AppIcons.reel3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: reels.length,
              itemBuilder: (context, index) {
                return Stack(children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      reels[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 220,
                    right: 12,
                    child: Column(
                      spacing: 10,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                AppIcons.thumbsUp,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Text(
                              "like",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                AppIcons.thumbDown,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Text(
                              "Dislike",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                AppIcons.comment,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Text(
                              "3",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                AppIcons.share,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Text(
                              "share",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                AppIcons.addAlarm,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Text(
                              "remix",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 560,
                      left: 12,
                      child: Column(
                        children: [
                          Row(children: [
                            Container(
                              width: Scale.screenWidth * 0.11,
                              height: Scale.screenHeight * 0.05,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.toScale),
                                image: const DecorationImage(
                                  image: AssetImage(AppIcons.reel2),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Bandiya",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                minimumSize: Size(50, 30),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Subscribe",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            )
                          ]),
                        ],
                      )),
                  Positioned(
                      top: 600,
                      child: Container(
                        width: 370,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Angry Ramen serve everywhere khake piyo ya peeke khao !! #koreanfood #momolover",
                          maxLines: 2,
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                ]);
              },
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 70,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(0, 194, 19, 19),
                ),
                child: Row(
                  spacing: 176,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon:
                              const Icon(Icons.more_vert, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
