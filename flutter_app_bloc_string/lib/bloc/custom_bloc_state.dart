part of 'custom_bloc.dart';

abstract class CustomBlocState extends Equatable {
  const CustomBlocState();
}

class CustomBlocInitial extends CustomBlocState {
  const CustomBlocInitial({this.initialState});

  final PostUsers initialState;

  @override
  List<Object> get props => [initialState];
}

class CustomState extends CustomBlocState {
  const CustomState({this.listPostUsers});

  final PostUsers listPostUsers;

  @override
  List<Object> get props => [listPostUsers];
}
