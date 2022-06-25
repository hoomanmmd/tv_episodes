import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_episode_tracker/data/network/api_client.dart';
import 'package:tv_episode_tracker/data/repositories/movie_repository.dart';
import 'package:tv_episode_tracker/ui/screens/home/blocs/home_bloc.dart';
import 'package:tv_episode_tracker/ui/screens/home/blocs/home_event.dart';
import 'package:tv_episode_tracker/ui/screens/home/blocs/home_state.dart';

import '../../../data/fake_api_client.dart';

void main() {
  test('Bloc initial state is correct', () {
    expect(homeBloc().state, const HomeInitialState());
  });

  test('Fetch movies from API', () async {
    await testBloc<HomeBloc, HomeState>(
      build: homeBloc,
      act: (bloc) => bloc.add(HomeGetMoviesEvent()),
      expect: () => [
        isA<HomeInitialState>(),
        isA<HomeSuccessState>(),
      ],
    );
  });

  test('Api Client error while fetching movies from API', () async {
    await testBloc<HomeBloc, HomeState>(
      build: () => homeBloc(apiClient: FakeApiClient(movieListError: 'err')),
      act: (bloc) => bloc.add(HomeGetMoviesEvent()),
      expect: () => [
        isA<HomeInitialState>(),
        isA<HomeErrorState>(),
      ],
    );
  });
}

HomeBloc homeBloc({
  ApiClient? apiClient,
}) =>
    HomeBloc(
      repository: MovieRepository(apiClient: apiClient ?? FakeApiClient()),
    );
