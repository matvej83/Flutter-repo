part of 'counter_bloc.dart';

abstract class CounterBlocState extends Equatable {
  const CounterBlocState();
}

class CounterBlocInitial extends CounterBlocState {
  const CounterBlocInitial({this.initialState});

  final int initialState;
  @override
  List<Object> get props => [initialState];
}

class CounterState extends CounterBlocState {
  const CounterState({this.counter});

  final int counter;
  @override
  List<Object> get props => [counter];
}
