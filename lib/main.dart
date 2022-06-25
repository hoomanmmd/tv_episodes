import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'commons/app_route.dart';
import 'commons/app_theme.dart';
import 'data/network/api_client.dart';
import 'data/repositories/movie_repository.dart';

void main() {
  runApp(MyApp(
    repository: MovieRepository(apiClient: ApiClient()),
  ));
}

// add lottie intro

class MyApp extends StatelessWidget {
  final MovieRepository repository;

  const MyApp({
    required this.repository,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final router = AppRoute.router;

    return RepositoryProvider.value(
      value: repository,
      child: MaterialApp.router(
        title: 'TV Episode tracker',
        theme: AppTheme.themeData(context),
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
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
