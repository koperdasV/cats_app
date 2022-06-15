import 'package:bloc/bloc.dart';
import 'package:cats_app/domain/api/api_client.dart';
import 'package:cats_app/domain/model/cats_model.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../../domain/entity/cats.dart';

part 'cats_event.dart';
part 'cats_state.dart';

class CatsListBloc extends Bloc<CatsListEvent, CatsListState> {
  final ApiClient _apiClient;
  final client = http.Client();

  CatsListBloc(this._apiClient) : super(CatsLoadingState()) {
    on<LoadCatsEvent>((event, emit) async {
      emit(CatsLoadingState());
      try {
        final cats = await _apiClient.getCats(client);
        emit(CatsLoadedState(cats));
      } catch (e) {
        emit(CatsErrorState(e.toString()));
      }
    });
  }
}
