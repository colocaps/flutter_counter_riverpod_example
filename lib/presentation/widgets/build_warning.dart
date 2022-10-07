import 'package:contador_riverpod/bussiness_logic/counter_provider/counter_provider.dart';
import 'package:contador_riverpod/bussiness_logic/counter_provider/counter_provider_state.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildWarning extends StatelessWidget {
  final WidgetRef _ref;
  final StateNotifierProvider<CounterProvider, CounterState> _counterProvider;
  const BuildWarning({
    Key? key,
    required WidgetRef ref,
    required final StateNotifierProvider<CounterProvider, CounterState>
        counterProvider,
  })  : _ref = ref,
        _counterProvider = counterProvider,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Text(
              'Numero Negativo',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomIconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async =>
                await _ref.read(_counterProvider.notifier).initState(),
          ),
        ],
      ),
    );
  }
}
