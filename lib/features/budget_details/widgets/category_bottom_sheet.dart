import 'package:flutter/material.dart';

import '../../../core/entities/category.dart';
import 'category_colors_bottom_sheet.dart';
import 'category_icons_bottom_sheet.dart';

class CategoryBottomSheet extends StatefulWidget {
  const CategoryBottomSheet({super.key});

  @override
  State<CategoryBottomSheet> createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
  final titleController = TextEditingController();
  var icon = Category.icons.values.first;
  var color = Category.colors.first;
  var canSave = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Nova categoria'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
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
              ? () => Navigator.pop(
                    context,
                    Category.lazy(
                      title: titleController.text.trim(),
                      icon: icon,
                      backgroundColor: color,
                    ),
                  )
              : null,
          child: const Text('SALVAR'),
        ),
      ],
    );
  }

  void validate() {
    setState(() => canSave = titleController.text.trim().isNotEmpty);
  }
}
