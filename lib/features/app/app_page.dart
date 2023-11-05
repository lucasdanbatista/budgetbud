import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../settings/settings_controller.dart';
import 'app_router.dart';

class MainApp extends StatelessWidget {
  final AppRouter router;
  final SettingsController settingsController;

  const MainApp({
    super.key,
    required this.router,
    required this.settingsController,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'BudgetBud',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            brightness: settingsController.isDarkModeEnabled
                ? Brightness.dark
                : Brightness.light,
            seedColor: Colors.green,
          ),
          badgeTheme: const BadgeThemeData(
            backgroundColor: Colors.green,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          ),
        ),
        routerConfig: router.config(),
      ),
    );
  }
}
