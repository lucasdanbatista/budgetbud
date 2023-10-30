import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../utils/mixins/init_state_mixin.dart';
import '../app/app_router.gr.dart';
import 'budget_list_controller.dart';

@RoutePage()
class BudgetListPage extends StatelessWidget with InitStateMixin {
  final controller = GetIt.I<BudgetListController>();

  BudgetListPage({super.key});

  @override
  Future<void> initState() async {
    await controller.init();
    await controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orçamentos'),
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: controller.budgets.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(controller.budgets[index].title),
            onTap: () => context.pushRoute(
              CategoryListRoute(
                controller: GetIt.I(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
