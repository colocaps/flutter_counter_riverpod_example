import 'package:contador_riverpod/bussiness_logic/counter_provider/counter_provider.dart';
import 'package:contador_riverpod/bussiness_logic/counter_provider/counter_provider_state.dart';
import 'package:contador_riverpod/presentation/widgets/build_counter_text.dart';
import 'package:contador_riverpod/presentation/widgets/build_warning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildCounterByState extends StatelessWidget {
  final WidgetRef _ref;

  final StateNotifierProvider<CounterProvider, CounterState> _counterProvider;

  const BuildCounterByState({
    Key? key,
    required WidgetRef ref,
    required StateNotifierProvider<CounterProvider, CounterState>
        counterProvider,
  })  : _ref = ref,
        _counterProvider = counterProvider,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = _ref.watch(_counterProvider);

    if (state is Initial) {
      var value = state.value;
      return BuildCounterText(
        text: value.toString(),
      );
    } else if (state is IncrementValue) {
      var value = state.value;
      return BuildCounterText(
        text: value.toString(),
      );
    } else if (state is DecrementValue) {
      var value = state.value;
      return BuildCounterText(
        text: value.toString(),
      );
    } else if (state is Warning) {
      return BuildWarning(
        counterProvider: _counterProvider,
        ref: _ref,
      );
    }

    return Container();
  }
}
