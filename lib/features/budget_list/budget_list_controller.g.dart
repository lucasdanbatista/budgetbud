// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BudgetListController on BudgetListControllerBase, Store {
  late final _$budgetsAtom =
      Atom(name: 'BudgetListControllerBase.budgets', context: context);

  @override
  ObservableList<Budget> get budgets {
    _$budgetsAtom.reportRead();
    return super.budgets;
  }

  @override
  set budgets(ObservableList<Budget> value) {
    _$budgetsAtom.reportWrite(value, super.budgets, () {
      super.budgets = value;
    });
  }

  late final _$fetchActiveAsyncAction =
      AsyncAction('BudgetListControllerBase.fetchActive', context: context);

  @override
  Future<void> fetchActive() {
    return _$fetchActiveAsyncAction.run(() => super.fetchActive());
  }

  @override
  String toString() {
    return '''
budgets: ${budgets}
    ''';
  }
}
