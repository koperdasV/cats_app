part of 'cats_bloc.dart';

abstract class CatsListState extends Equatable {}

class CatsLoadingState extends CatsListState {
  @override
  List<Object> get props => [];
}

class CatsLoadedState extends CatsListState {
  final List<Cats> cats;

  CatsLoadedState(this.cats);
  @override
  List<Object> get props => [cats];
}

class CatsErrorState extends CatsListState {
  final String error;

  CatsErrorState(this.error);
  @override
  List<Object> get props => [error];
}
