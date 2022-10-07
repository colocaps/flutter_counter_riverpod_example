import 'package:contador_riverpod/bussiness_logic/counter_provider/counter_provider.dart';
import 'package:contador_riverpod/bussiness_logic/counter_provider/counter_provider_state.dart';
import 'package:contador_riverpod/presentation/widgets/build_counter_text.dart';
import 'package:contador_riverpod/presentation/widgets/build_warning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterTextComponent extends ConsumerWidget {
  final StateNotifierProvider<CounterProvider, CounterState> _counterProvider;

  const CounterTextComponent({
    Key? key,
    required StateNotifierProvider<CounterProvider, CounterState>
        counterProvider,
  })  : _counterProvider = counterProvider,
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: _buildByState);
  }

  Widget _buildByState(
    BuildContext context,
    WidgetRef ref,
    Widget? widget,
  ) {
    final state = ref.watch(_counterProvider);

    ref.listen<CounterState>(_counterProvider, (previousState, newState) {
      if (newState is Message) {
        var snackBar = const SnackBar(
          content: Text(
            'Ha llegado al numero 10',
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

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
        ref: ref,
      );
    }

    return Container();
  }
}
