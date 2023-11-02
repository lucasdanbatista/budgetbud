import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/entities/budget.dart';
import '../../../utils/extensions/date_time.dart';
import '../../../utils/extensions/int.dart';

class BudgetBottomSheet extends StatefulWidget {
  final Budget? budget;

  const BudgetBottomSheet({
    super.key,
    this.budget,
  });

  @override
  State<BudgetBottomSheet> createState() => _BudgetBottomSheetState();
}

class _BudgetBottomSheetState extends State<BudgetBottomSheet> {
  final titleController = TextEditingController();
  final startAtController = TextEditingController();
  final endAtController = TextEditingController();
  DateTime? startAt;
  DateTime? endAt;
  late bool canSave;

  @override
  void initState() {
    super.initState();
    if (widget.budget != null) {
      titleController.text = widget.budget!.title;
      startAtController.text = DateFormat.yMd().format(widget.budget!.startAt);
      endAtController.text = DateFormat.yMd().format(widget.budget!.endAt);
      startAt = widget.budget!.startAt;
      endAt = widget.budget!.endAt;
    }
    validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('${widget.budget != null ? 'Novo' : 'Editar'} orçamento'),
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
                      initialDate: startAt ?? DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(365.days),
                    );
                    if (date != null) {
                      startAtController.text = DateFormat.yMd().format(date);
                      setState(() {
                        startAt = date;
                        if (endAt != null && date > endAt!) {
                          endAt = null;
                          endAtController.clear();
                        }
                      });
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
                enabled: startAt != null,
                readOnly: true,
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: endAt ?? startAt!,
                    firstDate: startAt!,
                    lastDate: startAt!.add(365.days),
                  );
                  if (date != null) {
                    endAtController.text = DateFormat.yMd().format(date);
                    setState(() => endAt = date);
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
                  final result = widget.budget ?? Budget.lazy();
                  result.title = titleController.text.trim();
                  result.startAt = startAt!;
                  result.endAt = endAt!;
                  Navigator.pop(context, result);
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
          startAt != null &&
          endAt != null;
    });
  }
}
