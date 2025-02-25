import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/providers/carousal_provider.dart';

class ImageCarousel extends ConsumerWidget {
  final List<String> images;

  const ImageCarousel({super.key, required this.images});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(carousalProvider);
    return Stack(
      children: [
        PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          onPageChanged: (index) {
            ref.read(carousalProvider.notifier).updateIndex(index);
          },
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(6),
              child: Image.asset(
                images[index],
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
              '${currentIndex + 1}/${images.length}',
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
