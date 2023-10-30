import 'package:flutter/material.dart';

import 'entity.dart';

class Category extends Entity {
  late final String id;
  late final String title;
  late final IconData icon;
  late final Color backgroundColor;
  late final double budgetLimit;
  static const icons = [
    Icons.restaurant_outlined,
    Icons.shopping_cart_outlined,
    Icons.dry_cleaning_outlined,
    Icons.receipt_long_outlined,
    Icons.home_outlined,
    Icons.directions_car_outlined,
    Icons.beach_access_outlined,
    Icons.card_travel_outlined,
  ];

  Category.lazy({
    String? id,
    String? title,
    IconData? icon,
    Color? backgroundColor,
    double? budgetLimit,
  }) {
    if (id != null) this.id = id;
    if (title != null) this.title = title;
    if (icon != null) this.icon = icon;
    if (backgroundColor != null) this.backgroundColor = backgroundColor;
    if (budgetLimit != null) this.budgetLimit = budgetLimit;
  }

  factory Category({
    required String id,
    required String title,
    required IconData icon,
    required Color backgroundColor,
    required double budgetLimit,
  }) =>
      Category.lazy(
        id: id,
        title: title,
        icon: icon,
        backgroundColor: backgroundColor,
        budgetLimit: budgetLimit,
      );
}
