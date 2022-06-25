part of '../detail_screen.dart';

class DetailDescription extends StatelessWidget {
  const DetailDescription({
    this.model,
    super.key,
  });

  final MovieDetailModel? model;

  @override
  Widget build(BuildContext context) {
    return model == null
        ? Container(
            width: double.infinity,
            height: 16,
            color: Theme.of(context)
                .extension<CustomColorScheme>()!
                .placeholderColor,
          )
        : Text(
            model!.description,
            style: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .color!
                  .withOpacity(0.5),
            ),
          );
  }
}
