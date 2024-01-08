import 'package:flutter/material.dart';
import 'package:pizza_order_66/l10n/l10n.dart';
import 'package:pizza_order_66/menu_pizza/view/menu/menu_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cardTheme: const CardTheme(
          color: Color(0xff429D3A),
        ),
        canvasColor: const Color(0xff93A891),
        primaryColor: const Color(0xffB5391D),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MenuPage(),
    );
  }
}
