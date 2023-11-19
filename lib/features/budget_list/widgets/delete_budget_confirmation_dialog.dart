import 'package:flutter/material.dart';

class DeleteBudgetConfirmationDialog extends StatelessWidget {
  final VoidCallback onDeletePressed;

  const DeleteBudgetConfirmationDialog({
    super.key,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Deletar orçamento?'),
      actions: [
        TextButton(
          onPressed: onDeletePressed,
          child: const Text('SIM'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('NÃO'),
        ),
      ],
    );
  }
}
