class Video {
  final String thumbnail;
  final String title;
  final String duration;
  final String link;
  final String channelName;
  final String views;
  final String uploadDate;

  Video({
    required this.thumbnail,
    required this.title,
    required this.duration,
    required this.link,
    required this.channelName,
    required this.views,
    required this.uploadDate,
  });
}

List<Video> homeData = [
  Video(
    thumbnail: 'assets/images/image.jpeg',
    title: 'Flutter Tutorial',
    duration: '10:30',
    link: 'https://www.example.com/video1',
    channelName: 'FlutterDev',
    views: '1M',
    uploadDate: '2025-01-20',
  ),
  Video(
    thumbnail: 'assets/images/image2.jpeg',
    title: 'Dart Programming',
    duration: '15:45',
    link: 'https://www.example.com/video2',
    channelName: 'CodeWithDart',
    views: '2M',
    uploadDate: '2025-01-19',
  ),
  Video(
    thumbnail: 'assets/images/image3.jpeg',
    title: 'Flutter Tutorial',
    duration: '10:30',
    link: 'https://www.example.com/video1',
    channelName: 'FlutterDev',
    views: '1M',
    uploadDate: '2025-01-20',
  ),
  Video(
    thumbnail: 'assets/images/image.jpeg',
    title: 'Dart Programming',
    duration: '15:45',
    link: 'https://www.example.com/video2',
    channelName: 'CodeWithDart',
    views: '2M',
    uploadDate: '2025-01-19',
  ),
  Video(
    thumbnail: 'assets/images/image2.jpeg',
    title: 'Flutter Tutorial',
    duration: '10:30',
    link: 'https://www.example.com/video1',
    channelName: 'FlutterDev',
    views: '1M',
    uploadDate: '2025-01-20',
  ),
  Video(
    thumbnail: 'assets/images/image3.jpeg',
    title: 'Dart Programming',
    duration: '15:45',
    link: 'https://www.example.com/video2',
    channelName: 'CodeWithDart',
    views: '2M',
    uploadDate: '2025-01-19',
  ),
  Video(
    thumbnail: 'assets/images/image.jpeg',
    title: 'Flutter Tutorial',
    duration: '10:30',
    link: 'https://www.example.com/video1',
    channelName: 'FlutterDev',
    views: '1M',
    uploadDate: '2025-01-20',
  ),
  Video(
    thumbnail: 'assets/images/image2.jpeg',
    title: 'Dart Programming',
    duration: '15:45',
    link: 'https://www.example.com/video2',
    channelName: 'CodeWithDart',
    views: '2M',
    uploadDate: '2025-01-19',
  ),
  // Add more Video objects here
];