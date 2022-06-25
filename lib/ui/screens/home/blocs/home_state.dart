import 'package:equatable/equatable.dart';

import '../models/movie_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeSuccessState extends HomeState {
  final List<MovieModel> movies;

  const HomeSuccessState({
    required this.movies,
  });

  @override
  List<Object> get props => [movies];
}

class HomeErrorState extends HomeState {
  const HomeErrorState();
}

class HomeInitialState extends HomeState {
  const HomeInitialState();
}
