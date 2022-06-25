import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/network/cancelable_network.dart';
import '../../../../data/repositories/movie_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with CancelableNetwork {
  final MovieRepository repository;

  HomeBloc({
    required this.repository,
  }) : super(const HomeInitialState()) {
    on<HomeGetMoviesEvent>(_onGetMovies);
  }

  FutureOr<void> _onGetMovies(
    HomeGetMoviesEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(const HomeInitialState());
      final movies = await repository.getMovies(cancelToken: cancelToken);
      emit(HomeSuccessState(movies: movies));
    } catch (e) {
      emit(const HomeErrorState());
    }
  }
}
