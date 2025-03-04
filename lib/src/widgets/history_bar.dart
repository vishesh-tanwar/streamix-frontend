import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/providers/get_history_provider.dart';
import 'package:project/src/utils/scale.dart';

class HistoryBar extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HistoryBarState();
}

class HistoryBarState extends ConsumerState {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(getHistoryProvider.notifier).fetchHistory();
    }); // Fetch data once
  }

  @override
  Widget build(BuildContext context) {
    final historyItems = ref.watch(getHistoryProvider);
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                Strings.history,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 17,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 94, 92, 92)),
                  ),
                ),
                onPressed: () {
                  // View All action
                },
                child: const Text(
                  Strings.viewAll,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          SizedBox(height: Scale.screenHeight * 0.001),
          SizedBox(
            height: Scale.screenHeight * 0.17,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: historyItems.length,
              itemBuilder: (context, index) {
                final item = historyItems[index];
                return Container(
                  width: Scale.screenWidth * 0.37,
                  margin: const EdgeInsets.only(right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'http://192.168.1.30:3000${item.thumbnail}',
                              height: Scale.screenHeight * 0.09,
                              width: Scale.screenWidth * 0.36,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              top: 45,
                              left: 87,
                              child: Container(
                                width: Scale.screenWidth * 0.1,
                                height: Scale.screenHeight * 0.025,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(106, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    "10:23",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(height: Scale.screenHeight * 0.004),
                      Text(
                        item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
