import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends CounterState {
  final int value;

  Initial({required this.value});
  @override
  List<Object> get props => [value];
}

class IncrementValue extends CounterState {
  final int value;

  IncrementValue({required this.value});
  @override
  List<Object> get props => [value];
}

class DecrementValue extends CounterState {
  final int value;

  DecrementValue({required this.value});
  @override
  List<Object> get props => [value];
}

class Warning extends CounterState {}

class Message extends CounterState {}
