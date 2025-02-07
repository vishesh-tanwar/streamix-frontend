import 'package:flutter/material.dart';
import 'package:project/src/assets/icons.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/components/upload_body.dart';
import 'package:project/src/components/upload_bottom_bar.dart';
import 'package:project/src/utils/scale.dart';

class CreateVideoScreen extends StatefulWidget {
  @override
  State<CreateVideoScreen> createState() => _CreateVideoScreenState();
}

class _CreateVideoScreenState extends State<CreateVideoScreen> {
  final List<String> upload = [Strings.reel, Strings.video, Strings.post];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              children: [
                // Fixed header row
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.toScale,
                  ),
                  color: Colors.black,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          AppIcons.arrowBack,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        Strings.addDetails,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                // Scrollable content
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(10.toScale),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: Scale.screenHeight * 0.18,
                                width: Scale.screenWidth * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 190, 190, 190),
                                ),
                              ),
                              SizedBox(width: Scale.screenWidth * 0.03),
                              const Expanded(
                                child: Text(
                                  Strings.captionVideo,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 116, 114, 114),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Scale.screenHeight * 0.015,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(upload.length, (index) {
                                bool isSelected = index == selectedIndex;
                                return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: Container(
                                      width: Scale.screenWidth * 0.3,
                                      height: Scale.screenHeight * 0.05,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.grey[800],
                                        borderRadius:
                                            BorderRadius.circular(8.toScale),
                                      ),
                                      child: Text(
                                        upload[index],
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                    ));
                              })),
                          SizedBox(
                            height: Scale.screenHeight * 0.012,
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 54, 54, 54),
                            thickness: 2,
                          ),
                          SizedBox(height: Scale.screenHeight * 0.012),
                          Row(
                            children: [
                              Container(
                                width: Scale.screenWidth * 0.11,
                                height: Scale.screenHeight * 0.05,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(20.toScale),
                                  image: const DecorationImage(
                                    image: AssetImage(AppIcons.reel2),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: Scale.screenWidth * 0.016),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Vilgax',
                                      style: TextStyle(color: Colors.white)),
                                  Text("@vilgax1404",
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: Scale.screenHeight * 0.012),
                          UploadBody(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(bottom: 0, left: 0, right: 0, child: UploadBottomBar()),
          ],
        ),
      ),
    );
  }
}
