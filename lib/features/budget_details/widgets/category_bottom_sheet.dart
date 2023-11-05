import 'package:flutter/material.dart';

import '../../../core/entities/category.dart';
import '../../../utils/masks/currency_mask.dart';
import 'category_colors_bottom_sheet.dart';
import 'category_icons_bottom_sheet.dart';

class CategoryBottomSheet extends StatefulWidget {
  final Category? category;
  final ValueChanged<Category>? onDeletePressed;

  const CategoryBottomSheet({
    super.key,
    this.category,
    this.onDeletePressed,
  });

  @override
  State<CategoryBottomSheet> createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
  final titleController = TextEditingController();
  final budgetLimitController = TextEditingController();
  final budgetLimitMask = CurrencyMask();
  late IconData icon;
  late Color color;
  late bool canSave;

  @override
  void initState() {
    super.initState();
    if (widget.category != null) {
      titleController.text = widget.category!.title;
      budgetLimitController.text = budgetLimitMask.maskValue(
        widget.category!.limit,
      );
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
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: titleController,
                  onChanged: (_) => validate(),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.title),
                    border: OutlineInputBorder(),
                    hintText: 'Título',
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 12)),
                TextFormField(
                  inputFormatters: [budgetLimitMask],
                  maxLength: 9,
                  keyboardType: TextInputType.number,
                  controller: budgetLimitController,
                  onChanged: (_) => validate(),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.attach_money),
                    border: OutlineInputBorder(),
                    hintText: 'Limite',
                    counter: SizedBox.shrink(),
                  ),
                ),
              ],
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
              if (icon != null) {
                setState(() => this.icon = icon);
                if (!context.mounted) return;
                final color = await showModalBottomSheet<Color>(
                  context: context,
                  builder: (context) => const CategoryColorsBottomSheet(),
                );
                if (color != null) {
                  setState(() => this.color = color);
                }
              }
            },
          ),
        ],
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: _persistentFooterButtons,
    );
  }

  void validate() => setState(
        () => canSave = titleController.text.trim().isNotEmpty &&
            budgetLimitController.text.isNotEmpty,
      );

  List<Widget> get _persistentFooterButtons {
    final buttons = <Widget>[
      TextButton(
        onPressed: canSave
            ? () {
                final result = widget.category ?? Category.lazy();
                result.title = titleController.text.trim();
                result.limit = budgetLimitMask.unmaskText(
                  budgetLimitController.text,
                );
                result.icon = icon;
                result.color = color;
                Navigator.pop(context, result);
              }
            : null,
        child: const Text('SALVAR'),
      ),
    ];
    if (widget.category != null) {
      buttons.insert(
        0,
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.red.shade300,
          ),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Deletar categoria?'),
              actions: [
                TextButton(
                  onPressed: () async {
                    Navigator.of(context)
                      ..pop()
                      ..pop();
                    widget.onDeletePressed!(widget.category!);
                  },
                  child: const Text('SIM'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('NÃO'),
                ),
              ],
            ),
          ),
          child: const Text('DELETAR'),
        ),
      );
    }
    return buttons;
  }
}
