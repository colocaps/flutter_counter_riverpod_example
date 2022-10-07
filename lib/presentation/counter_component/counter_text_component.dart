import 'package:contador_riverpod/bussiness_logic/counter_provider/counter_provider.dart';
import 'package:contador_riverpod/bussiness_logic/counter_provider/counter_provider_state.dart';
import 'package:contador_riverpod/presentation/widgets/build_counter_by_state.dart';
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
    return Consumer(builder: (contex, ref, widget) {
      _listenByState(ref, context);

      return BuildCounterByState(
        counterProvider: _counterProvider,
        ref: ref,
      );
    });
  }

  void _listenByState(WidgetRef ref, BuildContext context) {
    ref.listen<CounterState>(_counterProvider, (
      previousState,
      newState,
    ) {
      if (newState is Message) {
        var snackBar = const SnackBar(
          content: Text(
            'Ha llegado al numero 10',
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }
}
