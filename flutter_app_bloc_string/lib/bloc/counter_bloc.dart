import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/network_manager.dart';

part 'counter_bloc_event.dart';
part 'counter_bloc_state.dart';

class CounterBlocBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  String isString = 'initialString';
//  NetworkManager networkManager = NetworkManager();

  @override
  CounterBlocState get initialState => CounterBlocInitial(initialState: isString);

  @override
  Stream<CounterBlocState> mapEventToState(
    CounterBlocEvent event,
  ) async* {
    if (event is IncreaseCounter) {
      yield CounterState(isString: event.isString);

//    } else if (event is DecreaseCounter) {
    }
  }
}