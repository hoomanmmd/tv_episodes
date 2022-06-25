import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeMovieTitle extends StatelessWidget {
  const HomeMovieTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          top: 16,
          start: 24,
        ),
        child: Text(
          AppLocalizations.of(context)!.today_s_episode,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.w100),
        ),
      ),
    );
  }
}
