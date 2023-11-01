// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BudgetDetailsController on BudgetDetailsControllerBase, Store {
  Computed<double>? _$totalUtilizedComputed;

  @override
  double get totalUtilized =>
      (_$totalUtilizedComputed ??= Computed<double>(() => super.totalUtilized,
              name: 'BudgetDetailsControllerBase.totalUtilized'))
          .value;
  Computed<double>? _$totalBudgetLimitComputed;

  @override
  double get totalBudgetLimit => (_$totalBudgetLimitComputed ??=
          Computed<double>(() => super.totalBudgetLimit,
              name: 'BudgetDetailsControllerBase.totalBudgetLimit'))
      .value;

  late final _$expensesAtom =
      Atom(name: 'BudgetDetailsControllerBase.expenses', context: context);

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

  late final _$categoriesAtom =
      Atom(name: 'BudgetDetailsControllerBase.categories', context: context);

  @override
  ObservableList<Category> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<Category> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('BudgetDetailsControllerBase.fetch', context: context);

  @override
  Future<void> fetch(Budget budget) {
    return _$fetchAsyncAction.run(() => super.fetch(budget));
  }

  @override
  String toString() {
    return '''
expenses: ${expenses},
categories: ${categories},
totalUtilized: ${totalUtilized},
totalBudgetLimit: ${totalBudgetLimit}
    ''';
  }
}
