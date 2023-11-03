import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/entities/expense.dart';
import '../../utils/mixins/init_state_mixin.dart';
import '../../widgets/expense_list_view.dart';
import 'category_details_controller.dart';
import 'widgets/expense_bottom_sheet.dart';

@RoutePage()
class CategoryDetailsPage extends StatelessWidget with InitStateMixin {
  final CategoryDetailsController controller;

  const CategoryDetailsPage({
    super.key,
    required this.controller,
  });

  @override
  Future<void> initState() async {
    await controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.category.title),
      ),
      body: Observer(
        builder: (context) => ExpenseListView(
          controller.expenses,
          onUpdate: (result) async {
            await controller.update(result);
            controller.fetch();
          },
          onDelete: (expense) async {
            await controller.delete(expense);
            controller.fetch();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final expense = await showModalBottomSheet<Expense>(
            isScrollControlled: true,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.7,
              minHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            context: context,
            builder: (context) => ExpenseBottomSheet(
              category: controller.category,
            ),
          );
          if (expense != null) {
            controller.create(expense);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
