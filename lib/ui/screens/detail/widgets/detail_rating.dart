part of '../detail_screen.dart';

final _yellowColor = Colors.yellow.shade800;

class DetailRating extends StatelessWidget {
  const DetailRating({
    this.model,
    super.key,
  });

  final MovieDetailModel? model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          color: _yellowColor,
          size: 24,
        ),
        const SizedBox(width: 2),
        Padding(
          padding: const EdgeInsets.only(top: 1.0),
          child: model == null
              ? Container(
                  color: _yellowColor,
                  width: 20,
                  height: 16,
                  alignment: Alignment.center,
                )
              : Text(
                  model!.score.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: _yellowColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
        ),
      ],
    );
  }
}
