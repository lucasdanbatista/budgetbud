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
        padding: const EdgeInsets.all(12),
        crossAxisCount: 7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: Category.colors
            .map(
              (e) => InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                child: Ink(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: e,
                    shape: BoxShape.circle,
                  ),
                ),
                onTap: () => Navigator.pop(context, e),
              ),
            )
            .toList(),
      ),
    );
  }
}
