import 'package:flutter/material.dart';
import 'package:project/src/assets/icons.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/components/bottom_drawer.dart';
import 'package:project/src/models/posts.dart';
import 'package:project/src/utils/scale.dart';
import 'package:project/src/widgets/carousel.dart';

class PostCard extends StatelessWidget {
  final Posts posts;

  const PostCard({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        vertical: Scale.screenHeight * 0.02,
        horizontal: Scale.screenWidth * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(posts.logo),
                radius: Scale.screenHeight * 0.025,
              ),
              SizedBox(width: Scale.screenWidth * 0.027),
              Text(
                posts.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: Scale.screenWidth * 0.18),
                Container(
                  margin: EdgeInsets.all(4.toScale),
                  padding: EdgeInsets.all(2.toScale),
                  width: Scale.screenWidth * 0.19,
                  height: Scale.screenHeight * 0.04,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 42, 42, 42)
                  ),
                  child: Center(child: Text(Strings.subscribe,style: TextStyle(color: Colors.white,fontSize: 11),)),
                ) ,
              IconButton(
                icon : Icon(AppIcons.threeDots,color: Colors.white,),
                onPressed: () {
                  showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return BottomDrawer(
                            icons: [AppIcons.flag,AppIcons.banned,AppIcons.banned],
                            texts: [Strings.report,Strings.notInterested,Strings.dontRecommend],
                          );
                        },
                      );
                },
              )
            ],
          ),
          SizedBox(height: Scale.screenHeight * 0.012),

          // Paragraph/Caption
          Text(
            posts.paragraph,
            style: TextStyle(color: Colors.white, fontSize: 13.toScale),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: Scale.screenHeight * 0.012),

          // Images
          if (posts.images.isNotEmpty)
            Container(
              height: Scale.screenHeight * 0.42,
              width: Scale.screenWidth ,
              color: Colors.black,
              child: ImageCarousel(images : posts.images),
            ),

          // Likes and Comments Row
          SizedBox(height: Scale.screenHeight * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(AppIcons.thumbsUp, color: Colors.white, size: 20),
                  SizedBox(width: Scale.screenWidth * 0.01),
                  Text(
                    "${posts.likes} Likes",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(width: Scale.screenWidth * 0.04,),
                  const Icon(AppIcons.thumbDown, color: Colors.white, size: 20,),
                ],
              ),
              Row(
                children: [
                  const Icon(AppIcons.comment, color: Colors.white, size: 20),
                  SizedBox(width: Scale.screenWidth * 0.01),
                  Text(
                    "${posts.comments} Comments",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
