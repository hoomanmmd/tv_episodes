import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../commons/theme/custom_color_scheme.dart';
import '../../../widgets/custom_shimmer.dart';
import '../../detail/detail_screen.dart';
import '../home_screen.dart';
import '../models/movie_model.dart';

const _imageSize = 48.0;

class HomeMovieItem extends StatelessWidget {
  final MovieModel? movieModel;
  final bool isShimmerEnabled;

  const HomeMovieItem({
    required this.movieModel,
    required this.isShimmerEnabled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PhysicalModel(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        elevation: 8,
        shadowColor: Theme.of(context).shadowColor,
        color: Theme.of(context).backgroundColor,
        child: movieModel == null
            ? CustomShimmer(
                enabled: isShimmerEnabled,
                child: _row(context),
              )
            : Material(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: Theme.of(context).backgroundColor,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  onTap: () => _onItemTapped(context),
                  highlightColor: Theme.of(context).shadowColor,
                  child: _row(context),
                ),
              ),
      ),
    );
  }

  Widget _row(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            const SizedBox(width: 8),
            _avatar(context),
            const SizedBox(width: 16),
            Expanded(child: _title(context)),
          ],
        ),
      );

  Widget _title(BuildContext context) => movieModel == null
      ? Align(
          alignment: Alignment.centerLeft,
          child: Container(
            color: Theme.of(context)
                .extension<CustomColorScheme>()!
                .placeholderColor,
            width: 100,
            height: 15,
          ),
        )
      : Text(movieModel!.name);

  Widget _avatar(BuildContext context) {
    final placeholderColor =
        Theme.of(context).extension<CustomColorScheme>()!.placeholderColor;
    return ClipOval(
      child: movieModel == null
          ? Container(
              width: _imageSize,
              height: _imageSize,
              color: placeholderColor,
            )
          : CachedNetworkImage(
              width: _imageSize,
              height: _imageSize,
              fit: BoxFit.cover,
              imageUrl: movieModel!.imageUrl,
              placeholder: (_, __) => Container(color: placeholderColor),
              errorWidget: (_, __, ___) => Container(color: placeholderColor),
            ),
    );
  }

  void _onItemTapped(BuildContext context) {
    context.push(
      '${HomeScreen.routeName}${DetailScreen.routeName(movieModel!.id)}',
    );
  }
}
