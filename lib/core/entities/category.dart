import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'entity.dart';

class Category extends Entity {
  late final String title;
  late final IconData icon;
  late final Color backgroundColor;

  Category.lazy({
    String? title,
    IconData? icon,
    Color? backgroundColor,
  }) {
    if (title != null) this.title = title;
    if (icon != null) this.icon = icon;
    if (backgroundColor != null) this.backgroundColor = backgroundColor;
  }

  factory Category({
    required String title,
    required IconData icon,
    required Color backgroundColor,
  }) =>
      Category.lazy(
        title: title,
        icon: icon,
        backgroundColor: backgroundColor,
      );

  factory Category.mock() {
    assert(!kReleaseMode);
    final icons = [
      Icons.restaurant_outlined,
      Icons.shopping_cart_outlined,
      Icons.dry_cleaning_outlined,
      Icons.receipt_long_outlined,
      Icons.home_outlined,
      Icons.directions_car_outlined,
      Icons.beach_access_outlined,
      Icons.card_travel_outlined,
    ];
    final colors = [
      Colors.red.shade400,
      Colors.pink.shade400,
      Colors.green.shade400,
      Colors.lime.shade400,
      Colors.purple.shade400,
      Colors.deepPurple.shade400,
      Colors.blueGrey.shade400,
      Colors.yellow.shade400,
      Colors.orange.shade400,
      Colors.deepOrange.shade400,
      Colors.blue.shade400,
      Colors.amber.shade400,
    ];
    return Category(
      title: faker.lorem.words(2).join(' '),
      icon: icons[random.integer(icons.length)],
      backgroundColor: colors[random.integer(colors.length)],
    );
  }

  //TODO: Remove mock
  double get budget => 100;

  //TODO: Remove mock
  double get used => random.integer(100).toDouble();
}
