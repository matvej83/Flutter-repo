part of 'counter_bloc.dart';

abstract class CounterBlocEvent extends Equatable {
  const CounterBlocEvent();
}

class IncreaseCounter extends CounterBlocEvent {
  const IncreaseCounter({this.increment});

  final int increment;

  @override
  List<Object> get props => [increment];
}

class DecreaseCounter extends CounterBlocEvent {
  const DecreaseCounter({this.decrement});

  final int decrement;

  @override
  List<Object> get props => null;
}
