import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Normal Provider
final textProvider = Provider<String>((ref) => "hello");

// Future Provider
final futureProvider = FutureProvider<int>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return 5;
});

// Stream Provider
final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(Duration(seconds: 3), (number) {
    if (number < 5) {
      return number + 1;
    } else {
      return 5;
    }
  });
});

// State Provider
final stateProvider = StateProvider<int>((ref) => 0);

// State Notifier Provider
final stateNotifierProvider =
    StateNotifierProvider<CountNotifier>((ref) => CountNotifier(6));

class CountNotifier extends StateNotifier<int> {
  CountNotifier(int state) : super(6);

  void add() {
    state = state + 1;
  }

  void subtract() {
    state = state - 1;
  }
}

// Change Notifier Provider
final changeNotifierProvider =
    ChangeNotifierProvider<ChangeCount>((ref) => ChangeCount());

class ChangeCount extends ChangeNotifier {
  int number = 6;
  void add() {
    number++;
    notifyListeners();
  }

  void subtract() {
    number--;
    notifyListeners();
  }
}
