import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/entities/budget.dart';

class BudgetBottomSheet extends StatefulWidget {
  final String appBarTitle;

  const BudgetBottomSheet({
    super.key,
    required this.appBarTitle,
  });

  @override
  State<BudgetBottomSheet> createState() => _BudgetBottomSheetState();
}

class _BudgetBottomSheetState extends State<BudgetBottomSheet> {
  final titleController = TextEditingController();
  final startAtController = TextEditingController();
  final endAtController = TextEditingController();
  final budget = Budget.lazy();
  var canSave = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.appBarTitle),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  controller: startAtController,
                  readOnly: true,
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(
                        const Duration(days: 365 * 10),
                      ),
                      lastDate:
                          DateTime.now().add(const Duration(days: 365 * 10)),
                    );
                    if (date != null) {
                      startAtController.text = DateFormat.yMd().format(date);
                      budget.startAt = date;
                    }
                    validate();
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.event_outlined),
                    border: OutlineInputBorder(),
                    hintText: 'Data inicial',
                  ),
                ),
              ),
              TextFormField(
                controller: endAtController,
                readOnly: true,
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(
                      const Duration(days: 365 * 10),
                    ),
                    lastDate:
                        DateTime.now().add(const Duration(days: 365 * 10)),
                  );
                  if (date != null) {
                    endAtController.text = DateFormat.yMd().format(date);
                    budget.endAt = date;
                  }
                  validate();
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.event_outlined),
                  border: OutlineInputBorder(),
                  hintText: 'Data final',
                ),
              ),
            ],
          ),
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        TextButton(
          onPressed: canSave
              ? () {
                  budget.title = titleController.text.trim();
                  Navigator.pop(context, budget);
                }
              : null,
          child: const Text('SALVAR'),
        ),
      ],
    );
  }

  void validate() {
    setState(() {
      canSave = titleController.text.trim().isNotEmpty &&
          startAtController.text.isNotEmpty &&
          endAtController.text.isNotEmpty;
    });
  }
}
