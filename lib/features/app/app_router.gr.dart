// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:budgetbud/features/budget_details/budget_details_controller.dart'
    as _i6;
import 'package:budgetbud/features/budget_details/budget_details_page.dart'
    as _i1;
import 'package:budgetbud/features/category_details/category_details_controller.dart'
    as _i7;
import 'package:budgetbud/features/category_details/category_details_page.dart'
    as _i2;
import 'package:budgetbud/features/home/home_page.dart' as _i3;
import 'package:flutter/material.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    BudgetDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BudgetDetailsRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BudgetDetailsPage(
          key: args.key,
          controller: args.controller,
        ),
      );
    },
    CategoryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryDetailsRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CategoryDetailsPage(
          key: args.key,
          controller: args.controller,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BudgetDetailsPage]
class BudgetDetailsRoute extends _i4.PageRouteInfo<BudgetDetailsRouteArgs> {
  BudgetDetailsRoute({
    _i5.Key? key,
    required _i6.BudgetDetailsController controller,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          BudgetDetailsRoute.name,
          args: BudgetDetailsRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'BudgetDetailsRoute';

  static const _i4.PageInfo<BudgetDetailsRouteArgs> page =
      _i4.PageInfo<BudgetDetailsRouteArgs>(name);
}

class BudgetDetailsRouteArgs {
  const BudgetDetailsRouteArgs({
    this.key,
    required this.controller,
  });

  final _i5.Key? key;

  final _i6.BudgetDetailsController controller;

  @override
  String toString() {
    return 'BudgetDetailsRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [_i2.CategoryDetailsPage]
class CategoryDetailsRoute extends _i4.PageRouteInfo<CategoryDetailsRouteArgs> {
  CategoryDetailsRoute({
    _i5.Key? key,
    required _i7.CategoryDetailsController controller,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          CategoryDetailsRoute.name,
          args: CategoryDetailsRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryDetailsRoute';

  static const _i4.PageInfo<CategoryDetailsRouteArgs> page =
      _i4.PageInfo<CategoryDetailsRouteArgs>(name);
}

class CategoryDetailsRouteArgs {
  const CategoryDetailsRouteArgs({
    this.key,
    required this.controller,
  });

  final _i5.Key? key;

  final _i7.CategoryDetailsController controller;

  @override
  String toString() {
    return 'CategoryDetailsRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
