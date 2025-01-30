import 'package:flutter/material.dart';

// class ImageCarousel extends StatefulWidget {
//   final List<String> images;

//   const ImageCarousel({super.key, required this.images});

//   @override
//   State<ImageCarousel> createState() => _ImageCarouselState();
// }

// class _ImageCarouselState extends State<ImageCarousel> {
//   late PageController _pageController;
//   int currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: 0);
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         PageView.builder(
//           controller: _pageController,
//           scrollDirection: Axis.horizontal, 
//           itemCount: widget.images.length,
//           onPageChanged: (index) {
//             setState(() {
//               currentIndex = index;
//             });
//           },
//           itemBuilder: (context, index) {
//             return Container(
//               margin: const EdgeInsets.all(6),
//               child: Image.asset(
//                 widget.images[index],
//                 fit: BoxFit.cover,
//               ),
//             );
//           },
//         ),
//         Positioned(
//           top: 16,
//           right: 16,
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(127, 0, 0, 0),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Text(
//               '${currentIndex + 1}/${widget.images.length}',
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class ImageCarousel extends StatefulWidget {
  final List<String> images;

  const ImageCarousel({super.key, required this.images});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.images.length,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(6),
              child: Image.asset(
                widget.images[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        Positioned(
          top: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(127, 0, 0, 0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              '${currentIndex + 1}/${widget.images.length}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
