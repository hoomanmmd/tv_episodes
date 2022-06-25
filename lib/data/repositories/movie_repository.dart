import 'package:dio/dio.dart';

import '../../ui/screens/detail/models/movie_model_detail.dart';
import '../../ui/screens/home/models/movie_model.dart';
import '../network/api_client.dart';

class MovieRepository {
  final ApiClient apiClient;

  MovieRepository({
    required this.apiClient,
  });

  Future<List<MovieModel>> getMovies({CancelToken? cancelToken}) =>
      apiClient.getMovies(cancelToken: cancelToken);

  Future<MovieDetailModel> getMovieById(
    String id, {
    CancelToken? cancelToken,
  }) =>
      apiClient.getMovieById(id, cancelToken: cancelToken);
}
