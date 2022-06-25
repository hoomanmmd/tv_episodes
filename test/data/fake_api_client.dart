import 'package:dio/dio.dart';
import 'package:tv_episode_tracker/data/network/api_client.dart';
import 'package:tv_episode_tracker/ui/screens/detail/models/movie_model_detail.dart';
import 'package:tv_episode_tracker/ui/screens/home/models/movie_model.dart';

class FakeApiClient extends ApiClient {
  FakeApiClient({
    this.movieListError,
    this.movieDetailError,
  });

  final dynamic movieListError;

  final dynamic movieDetailError;

  static final MovieDetailModel _movieDetailModel = MovieDetailModel(
    id: 'a',
    name: 'movie title',
    imageUrl: 'https://google.com/fav.png',
    score: 8.8,
    imdbUrl: 'https://imdb.com',
    description: 'movie description',
  );

  @override
  Future<List<MovieModel>> getMovies({CancelToken? cancelToken}) async {
    if (movieListError != null) {
      throw movieListError;
    }
    return [
      MovieModel(
        id: _movieDetailModel.id,
        name: _movieDetailModel.name,
        imageUrl: _movieDetailModel.imageUrl,
      )
    ];
  }

  @override
  Future<MovieDetailModel> getMovieById(
    String id, {
    CancelToken? cancelToken,
  }) async {
    if (movieDetailError != null) {
      throw movieDetailError;
    }
    return _movieDetailModel;
  }
}
