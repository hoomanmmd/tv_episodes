import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'blocs/home_bloc.dart';
import 'blocs/home_event.dart';
import 'blocs/home_state.dart';
import 'widgets/home_movie_list.dart';
import 'widgets/home_movie_title.dart';

class HomeScreen extends HookWidget {
  static const routeName = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      BlocProvider.of<HomeBloc>(context).add(HomeGetMoviesEvent());
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.title)),
      body: Column(
        children: [
          const HomeMovieTitle(),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: BlocBuilder<HomeBloc, HomeState>(builder: _body),
            ),
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context, HomeState state) {
    return HomeMovieList(
      key: const Key('home_screen_list'),
      movieModels: state is HomeSuccessState
          ? state.movies
          : List.generate(3, (_) => null),
      onRetry: _maybeRetryCallback(context, state),
    );
  }

  VoidCallback? _maybeRetryCallback(BuildContext context, HomeState state) =>
      state is HomeErrorState
          ? () => BlocProvider.of<HomeBloc>(context).add(HomeGetMoviesEvent())
          : null;
}
