import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:line_icons/line_icons.dart';

import '../home/widgets/home_page_child.dart';
import 'settings_controller.dart';

class SettingsPage extends StatelessWidget with HomePageChild {
  final SettingsController controller;

  const SettingsPage({
    super.key,
    required this.controller,
  });

  @override
  String get appBarTitle => 'Ajustes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Observer(
            builder: (context) => SwitchListTile(
              title: const Text('Modo escuro'),
              secondary: const Icon(LineIcons.moonAlt),
              value: controller.isDarkModeEnabled,
              onChanged: controller.setDarkModeEnabled,
            ),
          ),
          const SwitchListTile(
            title: Text('Backup na nuvem'),
            subtitle: Text('Disponível em breve'),
            onChanged: null,
            value: false,
            secondary: Icon(LineIcons.cloud),
          ),
        ],
      ),
    );
  }
}
