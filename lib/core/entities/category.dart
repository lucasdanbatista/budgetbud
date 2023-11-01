import 'package:flutter/material.dart';

import 'budget.dart';
import 'entity.dart';

class Category extends Entity {
  late final String id;
  late final String title;
  late final IconData icon;
  late final Color backgroundColor;
  late final double budgetLimit;
  late final Budget budget;
  static const icons = {
    'ic_restaurant_outlined': Icons.restaurant_outlined,
    'ic_shopping_cart_outlined': Icons.shopping_cart_outlined,
    'ic_dry_cleaning_outlined': Icons.dry_cleaning_outlined,
    'ic_receipt_long_outlined': Icons.receipt_long_outlined,
    'ic_home_outlined': Icons.home_outlined,
    'ic_directions_car_outlined': Icons.directions_car_outlined,
    'ic_beach_access_outlined': Icons.beach_access_outlined,
    'ic_card_travel_outlined': Icons.card_travel_outlined,
  };
  static final colors = [
    Colors.red.shade400,
    Colors.pink.shade400,
    Colors.purple.shade400,
    Colors.deepPurple.shade400,
    Colors.indigo.shade400,
    Colors.blue.shade400,
    Colors.lightBlue.shade400,
    Colors.cyan.shade400,
    Colors.teal.shade400,
    Colors.green.shade400,
    Colors.lightGreen.shade400,
    Colors.lime.shade400,
    Colors.yellow.shade400,
    Colors.amber.shade400,
    Colors.orange.shade400,
    Colors.lime.shade400,
    Colors.deepOrange.shade400,
    Colors.brown.shade400,
    Colors.grey.shade400,
    Colors.blueGrey.shade400,
    Colors.black87,
  ];

  static String getIconName(IconData icon) {
    var key = '';
    icons.forEach((k, v) {
      if (v == icon) key = k;
    });
    return key;
  }

  Category.lazy({
    String? id,
    Budget? budget,
    String? title,
    IconData? icon,
    Color? backgroundColor,
    double? budgetLimit,
  }) {
    if (id != null) this.id = id;
    if (budget != null) this.budget = budget;
    if (title != null) this.title = title;
    if (icon != null) this.icon = icon;
    if (backgroundColor != null) this.backgroundColor = backgroundColor;
    if (budgetLimit != null) this.budgetLimit = budgetLimit;
  }

  factory Category({
    required String id,
    required Budget budget,
    required String title,
    required IconData icon,
    required Color backgroundColor,
    required double budgetLimit,
  }) =>
      Category.lazy(
        id: id,
        budget: budget,
        title: title,
        icon: icon,
        backgroundColor: backgroundColor,
        budgetLimit: budgetLimit,
      );
}
