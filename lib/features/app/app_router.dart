import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: BudgetListRoute.page, initial: true),
        AutoRoute(page: CategoryListRoute.page),
        AutoRoute(page: ExpenseListRoute.page),
      ];
}
