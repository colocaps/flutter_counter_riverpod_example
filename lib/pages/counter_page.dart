import 'package:contador_riverpod/bussiness_logic/counter_provider/counter_provider.dart';
import 'package:contador_riverpod/bussiness_logic/counter_provider/counter_provider_state.dart';
import 'package:contador_riverpod/presentation/counter_component/counter_text_component.dart';
import 'package:contador_riverpod/presentation/widgets/build_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends StatelessWidget {
  final String title;
  const CounterPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterProvider =
        StateNotifierProvider<CounterProvider, CounterState>(
            (ref) => CounterProvider());
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Consumer(builder: (context, ref, child) {
        return BuildCounter(
          counterTextComponent:
              CounterTextComponent(counterProvider: counterProvider),
          onDecrementPressed: () async =>
              await ref.read(counterProvider.notifier).decrementValue(),
          onIncrementPressed: () async =>
              await ref.read(counterProvider.notifier).incrementValue(),
        );
      }),
    );
  }
}
