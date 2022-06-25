part of '../detail_screen.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({
    this.model,
    super.key,
  });

  final MovieDetailModel? model;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: context.pop,
      ),
      expandedHeight: _headerSize,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          model?.name ?? '',
          style: Theme.of(context).textTheme.headline6,
        ),
        expandedTitleScale: 2,
        background: _avatar(context),
      ),
    );
  }

  Widget _avatar(BuildContext context) {
    final placeholderColor =
        Theme.of(context).extension<CustomColorScheme>()!.placeholderColor;
    return Stack(
      children: [
        if (model == null)
          Container(
            width: double.infinity,
            color: placeholderColor,
          )
        else
          CachedNetworkImage(
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl: model!.imageUrl,
            placeholder: (_, __) => Container(color: placeholderColor),
            errorWidget: (_, __, ___) => Container(color: placeholderColor),
          ),
        Positioned.fill(
          child: Container(
            color: Theme.of(context).backgroundColor.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
