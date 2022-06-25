import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../../../commons/theme/custom_color_scheme.dart';
import '../../widgets/custom_shimmer.dart';
import '../../widgets/filled_button.dart';
import '../../widgets/retry_wrapper.dart';
import 'blocs/movie_detail_bloc.dart';
import 'blocs/movie_detail_event.dart';
import 'blocs/movie_detail_state.dart';
import 'models/movie_model_detail.dart';

part 'widgets/detail_app_bar.dart';
part 'widgets/detail_description.dart';
part 'widgets/detail_rating.dart';

const _headerSize = 200.0;

class DetailScreen extends HookWidget {
  static String routeName(String id) => 'detail/$id';

  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      BlocProvider.of<MovieDetailBloc>(context).add(GetMovieDetailEvent());
      return null;
    }, []);

    return Scaffold(
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          final model = state is MovieDetailSuccessState ? state.model : null;
          final retryCallback = _maybeRetryCallback(context, state);
          final child = RetryWrapper(
            onRetry: retryCallback,
            child: Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    DetailAppBar(model: model),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          const SizedBox(height: 24),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: DetailRating(model: model),
                          ),
                          const SizedBox(height: 24),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: DetailDescription(model: model),
                          ),
                          const SizedBox(height: 700),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 32,
                  right: 32,
                  bottom: 8,
                  child: FilledButton(
                    label: AppLocalizations.of(context)!.imdb,
                    onPressed: _maybeImdbSite(context, state),
                  ),
                )
              ],
            ),
          );
          if (state is MovieDetailSuccessState) {
            return child;
          }
          return CustomShimmer(
            enabled: retryCallback == null,
            child: child,
          );
        },
      ),
    );
  }

  VoidCallback? _maybeRetryCallback(
    BuildContext context,
    MovieDetailState state,
  ) {
    return state is MovieDetailErrorState
        ? () => BlocProvider.of<MovieDetailBloc>(context).add(
              GetMovieDetailEvent(),
            )
        : null;
  }

  VoidCallback? _maybeImdbSite(
    BuildContext context,
    MovieDetailState state,
  ) {
    return state is MovieDetailSuccessState
        ? () {
            url_launcher.launchUrl(
              Uri.parse(state.model.imdbUrl),
              mode: url_launcher.LaunchMode.externalApplication,
            );
          }
        : null;
  }
}
