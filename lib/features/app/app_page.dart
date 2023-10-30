import 'package:flutter/material.dart';

import 'app_router.dart';

class MainApp extends StatelessWidget {
  final AppRouter router;

  const MainApp({
    super.key,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BudgetBud',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      ),
      routerConfig: router.config(),
    );
  }
}
