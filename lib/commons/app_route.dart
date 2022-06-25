import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../data/repositories/movie_repository.dart';
import '../ui/screens/detail/blocs/movie_detail_bloc.dart';
import '../ui/screens/detail/detail_screen.dart';
import '../ui/screens/home/blocs/home_bloc.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/splash/splash_screen.dart';

class AppRoute {
  AppRoute._();

  static GoRouter router = GoRouter(
    initialLocation: SplashScreen.routeName,
    routes: <GoRoute>[
      _splashRoute,
      _homeRoute,
    ],
  );

  static GoRoute get _splashRoute => GoRoute(
        path: SplashScreen.routeName,
        builder: (context, state) => const SplashScreen(),
      );

  static GoRoute get _homeRoute => GoRoute(
        path: HomeScreen.routeName,
        builder: (context, state) => BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
            repository: RepositoryProvider.of<MovieRepository>(context),
          ),
          child: const HomeScreen(),
        ),
        routes: [
          _detailRoute,
        ],
      );

  static GoRoute get _detailRoute => GoRoute(
        path: DetailScreen.routeName(':id'),
        builder: (context, state) {
          final movieId = state.params['id'];
          return BlocProvider(
            create: (context) => MovieDetailBloc(
              repository: RepositoryProvider.of<MovieRepository>(context),
              movieId: movieId ?? '',
            ),
            child: const DetailScreen(),
          );
        },
      );
}
