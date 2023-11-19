// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archived_budget_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArchivedBudgetListController
    on ArchivedBudgetListControllerBase, Store {
  late final _$archivedBudgetsAtom = Atom(
      name: 'ArchivedBudgetListControllerBase.archivedBudgets',
      context: context);

  @override
  ObservableList<Budget> get archivedBudgets {
    _$archivedBudgetsAtom.reportRead();
    return super.archivedBudgets;
  }

  @override
  set archivedBudgets(ObservableList<Budget> value) {
    _$archivedBudgetsAtom.reportWrite(value, super.archivedBudgets, () {
      super.archivedBudgets = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('ArchivedBudgetListControllerBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
archivedBudgets: ${archivedBudgets}
    ''';
  }
}
