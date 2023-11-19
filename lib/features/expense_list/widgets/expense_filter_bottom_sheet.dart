import 'package:flutter/material.dart';

import '../../../core/entities/expense_filter_options.dart';

class ExpenseFilterBottomSheet extends StatefulWidget {
  final ExpenseFilterOptions initialOptions;

  const ExpenseFilterBottomSheet({
    super.key,
    required this.initialOptions,
  });

  @override
  State<ExpenseFilterBottomSheet> createState() =>
      _ExpenseFilterBottomSheetState();
}

class _ExpenseFilterBottomSheetState extends State<ExpenseFilterBottomSheet> {
  late var options = widget.initialOptions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Filtrar despesas'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            value: options.onlyShowPendingExpenses,
            title: const Text('Exibir apenas despesas pendentes'),
            onChanged: (value) => setState(
              () => options = options.copyWith(
                onlyShowPendingExpenses: value,
              ),
            ),
          ),
        ],
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        TextButton(
          onPressed: () => Navigator.pop(context, options),
          child: const Text('FILTRAR'),
        ),
      ],
    );
  }
}
