// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BudgetDetailsController on BudgetDetailsControllerBase, Store {
  late final _$budgetAtom =
      Atom(name: 'BudgetDetailsControllerBase.budget', context: context);

  @override
  Budget get budget {
    _$budgetAtom.reportRead();
    return super.budget;
  }

  @override
  set budget(Budget value) {
    _$budgetAtom.reportWrite(value, super.budget, () {
      super.budget = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('BudgetDetailsControllerBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
budget: ${budget}
    ''';
  }
}
