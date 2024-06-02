import 'package:flutter_riverpod/flutter_riverpod.dart';

class TwoIntsNotifier extends StateNotifier<Map<String, int>> {
  TwoIntsNotifier() : super({'int1': 0, 'int2': 0});

  void incrementInt1() {
    state = {'int1': state['int1']! + 1, 'int2': state['int2']!};
  }

  void decrementInt1() {
    state = {'int1': state['int1']! - 1, 'int2': state['int2']!};
  }

  void incrementInt2() {
    state = {'int1': state['int1']!, 'int2': state['int2']! + 1};
  }

  void decrementInt2() {
    state = {'int1': state['int1']!, 'int2': state['int2']! - 1};
  }

  void clearInt2() {
    state = {'int1': state['int1']!, 'int2': 0};
  }

  void clearInt1() {
    state = {'int1': 0, 'int2': state['int2']!};
  }

  double calculateProgress() {
    final int1 = state['int1']!;
    final int2 = state['int2']!;
    if (int1 == 0) return 0;
    return (int2 / int1) * 100;
  }
}

final twoIntsProvider = StateNotifierProvider<TwoIntsNotifier, Map<String, int>>((ref) {
  return TwoIntsNotifier();
});

final progressProvider = StateProvider<double>((ref) {
  final twoInts = ref.watch(twoIntsProvider);
  final int1 = twoInts['int1'];
  final int2 = twoInts['int2'];
  if (int1 == 0) return 0.0;
  return (int2! / int1!) * 100;
});