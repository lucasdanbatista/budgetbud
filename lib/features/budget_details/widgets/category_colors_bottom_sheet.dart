import 'package:flutter/material.dart';

import '../../../core/entities/category.dart';

class CategoryColorsBottomSheet extends StatelessWidget {
  const CategoryColorsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Cores'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 6,
        children: Category.colors
            .map(
              (e) => IconButton(
                icon: Container(
                  decoration: BoxDecoration(
                    color: e,
                    shape: BoxShape.circle,
                  ),
                ),
                onPressed: () => Navigator.pop(context, e),
              ),
            )
            .toList(),
      ),
    );
  }
}
