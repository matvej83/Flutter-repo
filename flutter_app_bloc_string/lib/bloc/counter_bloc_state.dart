part of 'counter_bloc.dart';

abstract class CounterBlocState extends Equatable {
  const CounterBlocState();
}

class CounterBlocInitial extends CounterBlocState {
  const CounterBlocInitial({this.initialState});

  final String initialState;
  @override
  List<Object> get props => [initialState];
}

class CounterState extends CounterBlocState {
  const CounterState({this.isString});

  final String isString;
  @override
  List<Object> get props => [isString];
}
