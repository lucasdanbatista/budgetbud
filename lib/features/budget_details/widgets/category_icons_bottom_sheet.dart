import 'package:flutter/material.dart';

import '../../../core/entities/category.dart';

class CategoryIconsBottomSheet extends StatelessWidget {
  const CategoryIconsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Ícones'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 6,
        children: Category.icons.values
            .map(
              (e) => IconButton(
                icon: Icon(e),
                onPressed: () => Navigator.pop(context, e),
              ),
            )
            .toList(),
      ),
    );
  }
}
