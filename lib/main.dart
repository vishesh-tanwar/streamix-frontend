import 'package:flutter/material.dart';
import 'data.dart';
import 'bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomePage> {
  var category = [
    "All",
    "Gaming",
    "Music",
    "Flutter",
    "Bosses",
    "Arcade games"
  ];

  var iconMapping = {
    "Trending": Icons.trending_up,
    "Shopping": Icons.shopping_cart,
    "Music": Icons.music_note,
    "Films": Icons.movie,
    "Live": Icons.live_tv,
    "Gaming": Icons.sports_esports,
    "News": Icons.article,
    "Sport": Icons.sports_soccer,
    "Courses": Icons.school,
    "Fashion & beauty": Icons.style,
    "Podcasts": Icons.mic,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 250,
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 42,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Youtube",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
            ),
            ...iconMapping.entries.map((entry) {
              return ListTile(
                leading: Icon(entry.value,
                    color: const Color.fromARGB(255, 255, 255, 255)),
                title: Text(
                  entry.key,
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${entry.key} tapped")),
                  );
                },
              );
            }),
          ],
        ),
      ),
      body: Builder(
        builder: (BuildContext scaffoldContext) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.black,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 42,
                  ),
                ),
                titleSpacing: 0,
                title: const Text(
                  "YouTube",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    color: Colors.white,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Notifications icon tapped")),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    color: Colors.white,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Search icon tapped")),
                      );
                    },
                  ),
                ],
                pinned: false,
                floating: true,
                expandedHeight: 100,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                          height: kToolbarHeight), // Space for the title bar

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Scaffold.of(scaffoldContext).openDrawer();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(40, 40),
                              ),
                              child: const Icon(Icons.explore,
                                  color: Colors.white),
                            ),
                            ...category.map((cat) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 41, 41, 41),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                  ),
                                  child: Text(
                                    cat,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.black,
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: homeData.map((video) {
                      return Container(
                        width: 360,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 10, 10, 10),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              video.thumbnail,
                              width: 360,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 8),
                            // Title
                            Text(
                              video.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '${video.channelName} • ${video.views} views • ${video.uploadDate}',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 3),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
