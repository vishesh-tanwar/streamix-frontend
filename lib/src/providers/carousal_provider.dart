import 'package:flutter_riverpod/flutter_riverpod.dart';

final carousalProvider = StateNotifierProvider<carousalNotifier, int>((ref) {
  return carousalNotifier();
});

class carousalNotifier extends StateNotifier<int> {
  carousalNotifier() : super(0);

  void updateIndex(int index) {
    state = index;
  }
}
