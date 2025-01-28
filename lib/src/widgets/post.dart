import 'package:flutter/material.dart';
import 'package:project/src/models/posts.dart';
import 'package:project/src/utils/scale.dart';

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
                radius: Scale.screenHeight * 0.03,
              ),
              SizedBox(width: Scale.screenWidth * 0.03),
              Text(
                posts.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: Scale.screenWidth * 0.4,),
              Icon(Icons.more_vert,color: Colors.white,)
            ],
          ),
          SizedBox(height: Scale.screenHeight * 0.02),

          // Paragraph/Caption
          Text(
            posts.paragraph,
            style: TextStyle(color: Colors.white, fontSize: 17.toScale),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: Scale.screenHeight * 0.02),

          // Images
          if (posts.images.isNotEmpty)
            SizedBox(
              height: Scale.screenHeight * 0.4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: posts.images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: Scale.screenWidth * 0.03),
                    child:
                    Padding(padding: EdgeInsets.only(right: 2.toScale),
                      child: Image.asset(
                      posts.images[index],
                      fit: BoxFit.cover,
                      width: Scale.screenWidth * 0.85,
                      height: Scale.screenHeight * 0.3,
                    ),
                    )
                    
                  );
                },
              ),
            ),

          // Likes and Comments Row
          SizedBox(height: Scale.screenHeight * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.thumb_up, color: Colors.white, size: 20),
                  SizedBox(width: Scale.screenWidth * 0.01),
                  Text(
                    "${posts.likes} Likes",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(width: Scale.screenWidth * 0.04,),
                  const Icon(Icons.thumb_down_alt_outlined, color: Colors.white, size: 20,),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.comment, color: Colors.white, size: 20),
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
