import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/models/video.dart';
import 'package:project/src/providers/user_provider.dart';

final getHistoryProvider =
    StateNotifierProvider<getHistoryNotifier, List<GetVideoModel>>((ref) {
  return getHistoryNotifier(ref);
});

class getHistoryNotifier extends StateNotifier<List<GetVideoModel>> {
  final Ref ref;
  getHistoryNotifier(this.ref) : super([]);

  Future<void> fetchHistory() async {
    final user = ref.read(userProvider);
    final url =
        'http://192.168.1.30:3000/api/controllers/getHistoryById?userId=${user.id}';

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        print('Data received: ${response.data}');

        final List<dynamic> result = response.data['result'];

        final List<GetVideoModel> historyList =
            result.map((json) => GetVideoModel.fromJson(json)).toList();

        state = historyList;
        print('History fetched successfully! => $state');
      } else {
        print('Failed to fetch history: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching history: $e');
    }
  }
}
