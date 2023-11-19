import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../core/entities/budget.dart';
import '../app/app_router.gr.dart';
import '../home/widgets/home_page_child.dart';
import 'budget_list_controller.dart';
import 'widgets/budget_bottom_sheet.dart';
import 'widgets/budget_list_tile.dart';
import 'widgets/delete_budget_confirmation_dialog.dart';

class BudgetListPage extends StatefulWidget with HomePageChild {
  final BudgetListController controller;

  const BudgetListPage({
    super.key,
    required this.controller,
  });

  @override
  String get appBarTitle => 'Orçamentos';

  @override
  List<Widget>? get appBarActions => [
        Builder(
          builder: (context) => IconButton(
            onPressed: () async {
              await context.pushRoute(
                ArchivedBudgetListRoute(
                  controller: GetIt.I(),
                ),
              );
              controller.fetchActive();
            },
            icon: const Icon(Icons.archive_outlined),
          ),
        ),
      ];

  @override
  State<BudgetListPage> createState() => _BudgetListPageState();
}

class _BudgetListPageState extends State<BudgetListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    widget.controller.fetchActive();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Observer(
        builder: (context) => widget.controller.budgets.isEmpty
            ? const Center(
                child: Text('Não há orçamentos cadastrados.'),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(bottom: 96),
                itemCount: widget.controller.budgets.length,
                itemBuilder: (context, index) {
                  final budget = widget.controller.budgets[index];
                  return BudgetListTile(
                    budget,
                    onArchivePressed: () async {
                      await widget.controller.archive(budget);
                      widget.controller.fetchActive();
                    },
                    onEditPressed: () async {
                      final result = await showModalBottomSheet<Budget>(
                        isScrollControlled: true,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.7,
                          minHeight: MediaQuery.of(context).size.height * 0.7,
                        ),
                        context: context,
                        builder: (context) => BudgetBottomSheet(
                          budget: budget,
                        ),
                      );
                      if (result != null) {
                        await widget.controller.update(result);
                      }
                      widget.controller.fetchActive();
                    },
                    onDeletePressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) => DeleteBudgetConfirmationDialog(
                          onDeletePressed: () async {
                            Navigator.of(context).pop();
                            await widget.controller.delete(budget);
                            widget.controller.fetchActive();
                          },
                        ),
                      );
                    },
                    onTap: () async {
                      await context.pushRoute(
                        BudgetDetailsRoute(
                          controller: GetIt.I(param1: budget),
                        ),
                      );
                      widget.controller.fetchActive();
                    },
                  );
                },
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
            widget.controller.fetchActive();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
