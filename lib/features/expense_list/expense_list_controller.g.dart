// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExpenseListController on ExpenseListControllerBase, Store {
  late final _$expensesAtom =
      Atom(name: 'ExpenseListControllerBase.expenses', context: context);

  @override
  ObservableList<Expense> get expenses {
    _$expensesAtom.reportRead();
    return super.expenses;
  }

  @override
  set expenses(ObservableList<Expense> value) {
    _$expensesAtom.reportWrite(value, super.expenses, () {
      super.expenses = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('ExpenseListControllerBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  late final _$filterAsyncAction =
      AsyncAction('ExpenseListControllerBase.filter', context: context);

  @override
  Future<void> filter(ExpenseFilterOptions options) {
    return _$filterAsyncAction.run(() => super.filter(options));
  }

  @override
  String toString() {
    return '''
expenses: ${expenses}
    ''';
  }
}
