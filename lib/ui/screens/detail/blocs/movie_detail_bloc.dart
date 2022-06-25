import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/network/cancelable_network.dart';
import '../../../../data/repositories/movie_repository.dart';
import 'movie_detail_event.dart';
import 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState>
    with CancelableNetwork {
  final MovieRepository repository;
  final String movieId;

  MovieDetailBloc({
    required this.movieId,
    required this.repository,
  }) : super(const MovieDetailInitialState()) {
    on<GetMovieDetailEvent>(_onGetDetail);
  }

  void _onGetDetail(
    GetMovieDetailEvent event,
    Emitter<MovieDetailState> emit,
  ) async {
    emit(const MovieDetailInitialState());
    try {
      final movie = await repository.getMovieById(
        movieId,
        cancelToken: cancelToken,
      );
      emit(MovieDetailSuccessState(model: movie));
    } catch (e) {
      emit(const MovieDetailErrorState());
    }
  }
}
