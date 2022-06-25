import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tv_episode_tracker/commons/app_theme.dart';
import 'package:tv_episode_tracker/data/repositories/movie_repository.dart';

import '../../data/fake_api_client.dart';

class TestApp extends StatelessWidget {
  const TestApp({
    required this.child,
    this.repository,
    super.key,
  });

  final MovieRepository? repository;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: repository ?? MovieRepository(apiClient: FakeApiClient()),
      child: MaterialApp(
        title: 'TV Episode tracker',
        theme: AppTheme.themeData(context),
        home: child,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('en'),
        ],
      ),
    );
  }
}
