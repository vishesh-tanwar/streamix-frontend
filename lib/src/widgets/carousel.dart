import 'package:flutter/material.dart';
import 'package:project/src/utils/scale.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> images;

  const ImageCarousel({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselView(
          itemExtent: Scale.screenWidth * 0.83,
          itemSnapping: true,
          children: List.generate(images.length, (int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(7.0),
              child: Stack(
                children: [
                  Container(
                    height: Scale.screenHeight * 0.43,
                    width: Scale.screenWidth * 0.83,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage(images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: Scale.screenHeight * 0.02,
                    right: Scale.screenWidth * 0.02,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(127, 0, 0, 0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        '${index + 1}/${images.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}