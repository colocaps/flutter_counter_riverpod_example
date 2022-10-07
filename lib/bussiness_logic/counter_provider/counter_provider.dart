import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'counter_provider_state.dart';

class CounterProvider extends StateNotifier<CounterState> {
  CounterProvider() : super(Initial(value: 0));

  int value = 0;
  Future<void> incrementValue() async {
    value = value + 1;
    state = IncrementValue(value: value);

    if (value < 0) {
      state = Warning();
    }
    if (value == 10) {
      state = Message();
      state = Initial(value: value);
    }
  }

  Future<void> decrementValue() async {
    value = value - 1;
    state = DecrementValue(value: value);

    if (value < 0) {
      state = Warning();
    }
    if (value == 10) {
      state = Message();
      state = Initial(value: value);
    }
  }

  Future<void> initState() async {
    state = Initial(value: 0);
  }
}
