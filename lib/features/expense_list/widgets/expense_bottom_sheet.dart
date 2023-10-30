import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/entities/expense.dart';

class ExpenseBottomSheet extends StatefulWidget {
  final String appBarTitle;

  const ExpenseBottomSheet({
    super.key,
    required this.appBarTitle,
  });

  @override
  State<ExpenseBottomSheet> createState() => _ExpenseBottomSheetState();
}

class _ExpenseBottomSheetState extends State<ExpenseBottomSheet> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final madeAtController = TextEditingController();
  final expense = Expense.lazy();
  var canSave = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
        title: Text(widget.appBarTitle),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Título',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TextFormField(
                    controller: valueController,
                    onChanged: (_) => validate(),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Valor',
                    ),
                  ),
                ),
                TextFormField(
                  controller: madeAtController,
                  readOnly: true,
                  onChanged: (_) => validate(),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.event_outlined),
                    border: OutlineInputBorder(),
                    hintText: 'Data',
                  ),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(
                        const Duration(days: 10 * 365),
                      ),
                      lastDate: DateTime.now().add(
                        const Duration(days: 10 * 365),
                      ),
                    );
                    if (date != null) {
                      expense.madeAt = date;
                      madeAtController.text = DateFormat.yMMMEd().format(date);
                    }
                    validate();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        TextButton(
          onPressed: canSave
              ? () {
                  expense.title = titleController.text.trim();
                  expense.value = double.parse(valueController.text.trim());
                  Navigator.of(context).pop(expense);
                }
              : null,
          child: const Text('SALVAR'),
        ),
      ],
    );
  }

  void validate() => setState(() {
        canSave = titleController.text.trim().isNotEmpty &&
            valueController.text.trim().isNotEmpty &&
            madeAtController.text.trim().isNotEmpty;
      });
}
