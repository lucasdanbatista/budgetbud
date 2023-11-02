import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/entities/category.dart';
import '../../../core/entities/expense.dart';

class ExpenseBottomSheet extends StatefulWidget {
  final Category category;
  final Expense? expense;

  const ExpenseBottomSheet({
    super.key,
    required this.category,
    this.expense,
  });

  @override
  State<ExpenseBottomSheet> createState() => _ExpenseBottomSheetState();
}

class _ExpenseBottomSheetState extends State<ExpenseBottomSheet> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final madeAtController = TextEditingController();
  DateTime? madeAt;
  late bool canSave;

  @override
  void initState() {
    super.initState();
    if (widget.expense != null) {
      titleController.text = widget.expense!.title;
      valueController.text = widget.expense!.value.toString();
      madeAtController.text = DateFormat.yMd().format(widget.expense!.madeAt);
      madeAt = widget.expense!.madeAt;
    }
    validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
        title: Text('${widget.expense != null ? 'Editar' : 'Nova'} despesa'),
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
                  onChanged: (_) => validate(),
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
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.event_outlined),
                    border: OutlineInputBorder(),
                    hintText: 'Data',
                  ),
                  onTap: () async {
                    final now = DateTime.now();
                    final date = await showDatePicker(
                      context: context,
                      initialDate:
                          now.isBefore(widget.category.budget.startAt) ||
                                  now.isAfter(widget.category.budget.endAt)
                              ? widget.category.budget.startAt
                              : now,
                      firstDate: widget.category.budget.startAt,
                      lastDate: widget.category.budget.endAt,
                    );
                    if (date != null) {
                      madeAt = date;
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
                  final result = widget.expense ?? Expense.lazy();
                  result.category = widget.category;
                  result.title = titleController.text.trim();
                  result.value = double.parse(valueController.text.trim());
                  result.madeAt = madeAt!;
                  Navigator.of(context).pop(result);
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
            madeAt != null;
      });
}
