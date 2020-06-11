import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_bloc_event.dart';

part 'counter_bloc_state.dart';

class CounterBlocBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  int count = 0;

  @override
  CounterBlocState get initialState => CounterBlocInitial(initialState: count);

  @override
  Stream<CounterBlocState> mapEventToState(
    CounterBlocEvent event,
  ) async* {
    if (event is IncreaseCounter) {
      yield CounterState(counter: ++count);
    } else if (event is DecreaseCounter) {
      if (count > 0) yield CounterState(counter: --count);
    }
  }
}
