// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:budgetbud/features/budget_list/budget_list_page.dart' as _i1;
import 'package:budgetbud/features/category_list/category_list_controller.dart'
    as _i6;
import 'package:budgetbud/features/category_list/category_list_page.dart'
    as _i2;
import 'package:budgetbud/features/expense_list/expense_list_controller.dart'
    as _i7;
import 'package:budgetbud/features/expense_list/expense_list_page.dart' as _i3;
import 'package:flutter/material.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    BudgetListRoute.name: (routeData) {
      final args = routeData.argsAs<BudgetListRouteArgs>(
          orElse: () => const BudgetListRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BudgetListPage(key: args.key),
      );
    },
    CategoryListRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryListRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CategoryListPage(
          key: args.key,
          controller: args.controller,
        ),
      );
    },
    ExpenseListRoute.name: (routeData) {
      final args = routeData.argsAs<ExpenseListRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ExpenseListPage(
          key: args.key,
          controller: args.controller,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.BudgetListPage]
class BudgetListRoute extends _i4.PageRouteInfo<BudgetListRouteArgs> {
  BudgetListRoute({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          BudgetListRoute.name,
          args: BudgetListRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'BudgetListRoute';

  static const _i4.PageInfo<BudgetListRouteArgs> page =
      _i4.PageInfo<BudgetListRouteArgs>(name);
}

class BudgetListRouteArgs {
  const BudgetListRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'BudgetListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.CategoryListPage]
class CategoryListRoute extends _i4.PageRouteInfo<CategoryListRouteArgs> {
  CategoryListRoute({
    _i5.Key? key,
    required _i6.CategoryListController controller,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          CategoryListRoute.name,
          args: CategoryListRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryListRoute';

  static const _i4.PageInfo<CategoryListRouteArgs> page =
      _i4.PageInfo<CategoryListRouteArgs>(name);
}

class CategoryListRouteArgs {
  const CategoryListRouteArgs({
    this.key,
    required this.controller,
  });

  final _i5.Key? key;

  final _i6.CategoryListController controller;

  @override
  String toString() {
    return 'CategoryListRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [_i3.ExpenseListPage]
class ExpenseListRoute extends _i4.PageRouteInfo<ExpenseListRouteArgs> {
  ExpenseListRoute({
    _i5.Key? key,
    required _i7.ExpenseListController controller,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ExpenseListRoute.name,
          args: ExpenseListRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'ExpenseListRoute';

  static const _i4.PageInfo<ExpenseListRouteArgs> page =
      _i4.PageInfo<ExpenseListRouteArgs>(name);
}

class ExpenseListRouteArgs {
  const ExpenseListRouteArgs({
    this.key,
    required this.controller,
  });

  final _i5.Key? key;

  final _i7.ExpenseListController controller;

  @override
  String toString() {
    return 'ExpenseListRouteArgs{key: $key, controller: $controller}';
  }
}
