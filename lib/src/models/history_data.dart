import 'package:project/src/assets/icons.dart';

class HistoryData {
  final String thumbnailUrl;
  final String title;
  final String channelName;
  final String duration;

  HistoryData({
    required this.thumbnailUrl,
    required this.title,
    required this.channelName,
    required this.duration,
  });
}

List<HistoryData> historyItems = [
  HistoryData(
    thumbnailUrl: AppIcons.cameleon,
    title: "Learn Flutter in 1 Hour | Full Beginner Tutorial",
    channelName: "CodeWithMe",
    duration: "3:45",
  ),
  HistoryData(
    thumbnailUrl: AppIcons.moon,
    title: "Top 10 Tech Gadgets of 2024 You Must Try!",
    channelName: "GadgetZone",
    duration: "12:24",
  ),
  HistoryData(
    thumbnailUrl: AppIcons.ocean,
    title: "Calm Piano Music for Focus & Study",
    channelName: "Relaxing Vibes",
    duration: "3:12",
  ),
  HistoryData(
    thumbnailUrl: AppIcons.reel,
    title: "SpaceX's Mars Mission: Everything We Know",
    channelName: "TechExplained",
    duration: "18:47",
  ),
  HistoryData(
    thumbnailUrl: AppIcons.reel3,
    title: "The Ultimate Python Crash Course for Beginners",
    channelName: "LearnWithMike",
    duration: "2:45:20",
  ),
];
