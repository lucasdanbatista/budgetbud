import 'package:flutter/material.dart';

import '../../../core/entities/category.dart';
import 'category_colors_bottom_sheet.dart';
import 'category_icons_bottom_sheet.dart';

class CategoryBottomSheet extends StatefulWidget {
  final Category? category;

  const CategoryBottomSheet({
    super.key,
    this.category,
  });

  @override
  State<CategoryBottomSheet> createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
  final titleController = TextEditingController();
  final budgetLimitController = TextEditingController();
  late IconData icon;
  late Color color;
  late bool canSave;

  @override
  void initState() {
    super.initState();
    if (widget.category != null) {
      titleController.text = widget.category!.title;
      budgetLimitController.text = widget.category!.budgetLimit.toString();
    }
    icon = widget.category?.icon ?? Category.icons.values.first;
    color = widget.category?.color ?? Category.colors.first;
    validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('${widget.category != null ? 'Editar' : 'Nova'} categoria'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: TextFormField(
              keyboardType: TextInputType.name,
              controller: titleController,
              onChanged: (_) => validate(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Título',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: budgetLimitController,
              onChanged: (_) => validate(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Limite',
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: color,
              child: Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
            ),
            title: const Text('Ícone'),
            onTap: () async {
              if (!context.mounted) return;
              final icon = await showModalBottomSheet<IconData>(
                context: context,
                builder: (context) => const CategoryIconsBottomSheet(),
              );
              if (icon != null) setState(() => this.icon = icon);
              if (!context.mounted) return;
              final color = await showModalBottomSheet<Color>(
                context: context,
                builder: (context) => const CategoryColorsBottomSheet(),
              );
              if (color != null) setState(() => this.color = color);
            },
          ),
        ],
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        TextButton(
          onPressed: canSave
              ? () {
                  final result = widget.category ?? Category.lazy();
                  result.title = titleController.text.trim();
                  result.budgetLimit =
                      double.parse(budgetLimitController.text.trim());
                  result.icon = icon;
                  result.color = color;
                  Navigator.pop(context, result);
                }
              : null,
          child: const Text('SALVAR'),
        ),
      ],
    );
  }

  void validate() => setState(
        () => canSave = titleController.text.trim().isNotEmpty &&
            budgetLimitController.text.trim().isNotEmpty,
      );
}
