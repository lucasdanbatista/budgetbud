// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsController on SettingsControllerBase, Store {
  late final _$isDarkModeEnabledAtom =
      Atom(name: 'SettingsControllerBase.isDarkModeEnabled', context: context);

  @override
  bool get isDarkModeEnabled {
    _$isDarkModeEnabledAtom.reportRead();
    return super.isDarkModeEnabled;
  }

  @override
  set isDarkModeEnabled(bool value) {
    _$isDarkModeEnabledAtom.reportWrite(value, super.isDarkModeEnabled, () {
      super.isDarkModeEnabled = value;
    });
  }

  late final _$setDarkModeEnabledAsyncAction = AsyncAction(
      'SettingsControllerBase.setDarkModeEnabled',
      context: context);

  @override
  Future<void> setDarkModeEnabled(bool isEnabled) {
    return _$setDarkModeEnabledAsyncAction
        .run(() => super.setDarkModeEnabled(isEnabled));
  }

  late final _$fetchAsyncAction =
      AsyncAction('SettingsControllerBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
isDarkModeEnabled: ${isDarkModeEnabled}
    ''';
  }
}
