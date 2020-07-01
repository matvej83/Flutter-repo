import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/model/postUser.dart';
import 'package:test_app/network_manager.dart';

part 'custom_bloc_event.dart';

part 'custom_bloc_state.dart';

class CustomBlocBloc extends Bloc<CustomBlocEvent, CustomBlocState> {
  String notLoaded = 'No data has been loaded!';
  NetworkManager networkManager = NetworkManager();

  @override
  CustomBlocState get initialState =>
      CustomBlocInitial(initialState: notLoaded);

  @override
  Stream<CustomBlocState> mapEventToState(
    CustomBlocEvent event,
  ) async* {
    if (event is DataManager) {
      yield CustomState(listPostUsers: await networkManager.fetchUser());
    }
  }
}
