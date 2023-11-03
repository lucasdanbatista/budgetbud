import 'package:flutter/material.dart';

import '../core/entities/category.dart';

class CategoryAvatar extends StatelessWidget {
  final Category category;

  const CategoryAvatar(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: category.color,
      child: Icon(
        category.icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
