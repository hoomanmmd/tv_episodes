import 'package:equatable/equatable.dart';

import '../models/movie_model_detail.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object?> get props => [];
}

class MovieDetailSuccessState extends MovieDetailState {
  final MovieDetailModel model;

  const MovieDetailSuccessState({
    required this.model,
  });

  @override
  List<Object?> get props => [model];
}

class MovieDetailErrorState extends MovieDetailState {
  const MovieDetailErrorState();
}

class MovieDetailInitialState extends MovieDetailState {
  const MovieDetailInitialState();
}
