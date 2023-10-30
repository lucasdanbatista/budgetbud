// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:budgetbud/features/category_list/category_list_page.dart'
    as _i1;
import 'package:flutter/material.dart' as _i3;

abstract class $AppRouter extends _i2.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    CategoryListRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryListRouteArgs>(
          orElse: () => const CategoryListRouteArgs());
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CategoryListPage(key: args.key),
      );
    }
  };
}

/// generated route for
/// [_i1.CategoryListPage]
class CategoryListRoute extends _i2.PageRouteInfo<CategoryListRouteArgs> {
  CategoryListRoute({
    _i3.Key? key,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          CategoryListRoute.name,
          args: CategoryListRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CategoryListRoute';

  static const _i2.PageInfo<CategoryListRouteArgs> page =
      _i2.PageInfo<CategoryListRouteArgs>(name);
}

class CategoryListRouteArgs {
  const CategoryListRouteArgs({this.key});

  final _i3.Key? key;

  @override
  String toString() {
    return 'CategoryListRouteArgs{key: $key}';
  }
}
