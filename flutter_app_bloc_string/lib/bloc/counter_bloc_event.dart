part of 'counter_bloc.dart';

abstract class CounterBlocEvent extends Equatable {
  const CounterBlocEvent();
}

class IncreaseCounter extends CounterBlocEvent {

  const IncreaseCounter({this.isString});

  final String isString;

  @override
  List<Object> get props => [isString];
}

class DecreaseCounter extends CounterBlocEvent {
  const DecreaseCounter({this.decrement});

  final int decrement;

  @override
  List<Object> get props => null;
}
