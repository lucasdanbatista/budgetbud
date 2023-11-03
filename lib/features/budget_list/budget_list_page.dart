import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../core/entities/budget.dart';
import '../app/app_router.gr.dart';
import 'budget_list_controller.dart';
import 'widgets/budget_bottom_sheet.dart';
import 'widgets/budget_list_tile.dart';

class BudgetListPage extends StatefulWidget {
  final BudgetListController controller;

  const BudgetListPage({
    super.key,
    required this.controller,
  });

  @override
  State<BudgetListPage> createState() => _BudgetListPageState();
}

class _BudgetListPageState extends State<BudgetListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    widget.controller.fetch();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Observer(
        builder: (context) => ListView.builder(
          padding: const EdgeInsets.only(bottom: 96),
          itemCount: widget.controller.budgets.length,
          itemBuilder: (context, index) => BudgetListTile(
            widget.controller.budgets[index],
            onEditPressed: () async {
              final result = await showModalBottomSheet<Budget>(
                isScrollControlled: true,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.7,
                  minHeight: MediaQuery.of(context).size.height * 0.7,
                ),
                context: context,
                builder: (context) => BudgetBottomSheet(
                  budget: widget.controller.budgets[index],
                  onDeletePressed: widget.controller.delete,
                ),
              );
              if (result != null) {
                await widget.controller.update(result);
              }
              widget.controller.fetch();
            },
            onDeletePressed: () async {
              Navigator.pop(context);
              await widget.controller.delete(widget.controller.budgets[index]);
              widget.controller.fetch();
            },
            onTap: () async {
              await context.pushRoute(
                BudgetDetailsRoute(
                  controller: GetIt.I(
                    param1: widget.controller.budgets[index],
                  ),
                ),
              );
              widget.controller.fetch();
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final budget = await showModalBottomSheet<Budget>(
            isScrollControlled: true,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.7,
              minHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            context: context,
            builder: (context) => const BudgetBottomSheet(),
          );
          if (budget != null) {
            await widget.controller.create(budget);
            widget.controller.fetch();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
