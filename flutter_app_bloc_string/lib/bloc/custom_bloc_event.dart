part of 'custom_bloc.dart';

abstract class CustomBlocEvent extends Equatable {
  const CustomBlocEvent();
}

class DataManager extends CustomBlocEvent {

  const DataManager({this.customData});

  final String customData;

  @override
  List<Object> get props => [customData];
}
