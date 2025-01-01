// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:budgetbud/features/archived_budget_list/archived_budget_list_controller.dart'
    as _i7;
import 'package:budgetbud/features/archived_budget_list/archived_budget_list_page.dart'
    as _i1;
import 'package:budgetbud/features/budget_details/budget_details_controller.dart'
    as _i8;
import 'package:budgetbud/features/budget_details/budget_details_page.dart'
    as _i2;
import 'package:budgetbud/features/category_details/category_details_controller.dart'
    as _i9;
import 'package:budgetbud/features/category_details/category_details_page.dart'
    as _i3;
import 'package:budgetbud/features/home/home_page.dart' as _i4;
import 'package:flutter/material.dart' as _i6;

/// generated route for
/// [_i1.ArchivedBudgetListPage]
class ArchivedBudgetListRoute
    extends _i5.PageRouteInfo<ArchivedBudgetListRouteArgs> {
  ArchivedBudgetListRoute({
    _i6.Key? key,
    required _i7.ArchivedBudgetListController controller,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ArchivedBudgetListRoute.name,
          args: ArchivedBudgetListRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'ArchivedBudgetListRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ArchivedBudgetListRouteArgs>();
      return _i1.ArchivedBudgetListPage(
        key: args.key,
        controller: args.controller,
      );
    },
  );
}

class ArchivedBudgetListRouteArgs {
  const ArchivedBudgetListRouteArgs({
    this.key,
    required this.controller,
  });

  final _i6.Key? key;

  final _i7.ArchivedBudgetListController controller;

  @override
  String toString() {
    return 'ArchivedBudgetListRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [_i2.BudgetDetailsPage]
class BudgetDetailsRoute extends _i5.PageRouteInfo<BudgetDetailsRouteArgs> {
  BudgetDetailsRoute({
    _i6.Key? key,
    required _i8.BudgetDetailsController controller,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          BudgetDetailsRoute.name,
          args: BudgetDetailsRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'BudgetDetailsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BudgetDetailsRouteArgs>();
      return _i2.BudgetDetailsPage(
        key: args.key,
        controller: args.controller,
      );
    },
  );
}

class BudgetDetailsRouteArgs {
  const BudgetDetailsRouteArgs({
    this.key,
    required this.controller,
  });

  final _i6.Key? key;

  final _i8.BudgetDetailsController controller;

  @override
  String toString() {
    return 'BudgetDetailsRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [_i3.CategoryDetailsPage]
class CategoryDetailsRoute extends _i5.PageRouteInfo<CategoryDetailsRouteArgs> {
  CategoryDetailsRoute({
    _i6.Key? key,
    required _i9.CategoryDetailsController controller,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          CategoryDetailsRoute.name,
          args: CategoryDetailsRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryDetailsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategoryDetailsRouteArgs>();
      return _i3.CategoryDetailsPage(
        key: args.key,
        controller: args.controller,
      );
    },
  );
}

class CategoryDetailsRouteArgs {
  const CategoryDetailsRouteArgs({
    this.key,
    required this.controller,
  });

  final _i6.Key? key;

  final _i9.CategoryDetailsController controller;

  @override
  String toString() {
    return 'CategoryDetailsRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}
