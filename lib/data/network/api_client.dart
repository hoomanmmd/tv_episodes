import 'package:dio/dio.dart';

import '../../ui/screens/detail/models/movie_model_detail.dart';
import '../../ui/screens/home/models/movie_model.dart';

class ApiClient {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://62aeee9a3bbf46a35218a2b9.mockapi.io/api/v1/',
      connectTimeout: 12000,
      receiveTimeout: 12000,
      sendTimeout: 12000,
    ),
  );

  Future<List<MovieModel>> getMovies({CancelToken? cancelToken}) async {
    final result = await _dio.get<List<dynamic>>('movie');
    return result.data!
        .map<MovieModel>(
          (e) => MovieModel.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }

  Future<MovieDetailModel> getMovieById(
    String id, {
    CancelToken? cancelToken,
  }) async {
    final result = await _dio.get('movie/$id', cancelToken: cancelToken);
    return MovieDetailModel.fromJson(result.data! as Map<String, dynamic>);
  }
}
