import 'dart:math' as math;

import 'package:flutter/widgets.dart';

import '../../../widgets/retry_wrapper.dart';
import '../models/movie_model.dart';
import 'home_movie_item.dart';

class HomeMovieList extends StatelessWidget {
  final List<MovieModel?> movieModels;
  final VoidCallback? onRetry;

  const HomeMovieList({
    required this.movieModels,
    this.onRetry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RetryWrapper(
      onRetry: onRetry,
      child: LayoutBuilder(
        builder: (context, constraints) => GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: math.max(1, constraints.maxWidth ~/ 300),
            mainAxisExtent: 86,
          ),
          shrinkWrap: true,
          children: movieModels
              .map((e) => HomeMovieItem(
                    movieModel: e,
                    isShimmerEnabled: onRetry == null,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
