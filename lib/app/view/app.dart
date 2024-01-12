import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_order_66/app/app_bloc/app_bloc.dart';
import 'package:pizza_order_66/l10n/l10n.dart';

import '../../database/data_repository/data_auth_repository.dart';
import '../routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppBloc(dataAuthRepository: context.read<DataAuthRepository>()),
      child: MaterialApp(
        theme: ThemeData(
          elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white),
              backgroundColor: MaterialStatePropertyAll(
                Color(0xffB5391D),
              ),
            ),
          ),
          cardTheme: const CardTheme(
            color: Color(0xff429D3A),
          ),
          canvasColor: const Color(0xff93A891),
          primaryColor: const Color(0xffB5391D),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
            bodyLarge: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(builder: (context) {
          return Builder(
            builder: (context) => FlowBuilder(
                state: context.select((AppBloc bloc) => bloc.state.appStatus),
                onGeneratePages: onGenerateAppViewPages),
          );
        }),
      ),
    );
  }
}
