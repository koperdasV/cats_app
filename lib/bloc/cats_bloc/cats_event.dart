part of 'cats_bloc.dart';

abstract class CatsListEvent extends Equatable {
  const CatsListEvent();
}

class LoadCatsEvent extends CatsListEvent {
  @override
  List<Object> get props => [];
}
