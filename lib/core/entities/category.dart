import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'budget.dart';
import 'entity.dart';
import 'expense.dart';

class Category extends Entity {
  late final String id;
  late String title;
  late IconData icon;
  late Color color;
  late double limit;
  late final Budget budget;
  late final List<Expense> expenses;

  static const icons = {
    '8d0486d6': LineIcons.pizzaSlice,
    '7ebc6c2b': LineIcons.shoppingCart,
    '13f82d9e': LineIcons.tShirt,
    'cf357f08': LineIcons.moneyBill,
    '6df8f3ba': LineIcons.home,
    '0749e67f': LineIcons.car,
    '1dff11aa': LineIcons.compass,
    '7f41acb2': LineIcons.plane,
    'a410e0a4': LineIcons.heartbeat,
    'e7b4386f': LineIcons.gamepad,
    '033572c0': LineIcons.wrench,
    '2b2c3f83': LineIcons.gift,
    '0e9598e2': LineIcons.firstAid,
    '4c4145e2': LineIcons.wineGlass,
    '0f807d74': LineIcons.dog,
    '2f350878': LineIcons.cat,
    '341fa2b5': LineIcons.wallet,
    'e398d2a4': LineIcons.music,
    'ee7af55a': LineIcons.graduationCap,
    '6cd36444': LineIcons.creditCard,
    'dcb0b3d2': LineIcons.fileInvoiceWithUsDollar,
    '23ee6987': LineIcons.userFriends,
    '1b7ee9a0': LineIcons.piggyBank,
    '49550a2d': LineIcons.cut,
  };

  static final colors = [
    Colors.red.shade400,
    Colors.red.shade600,
    Colors.pink.shade400,
    Colors.pink.shade600,
    Colors.purple.shade400,
    Colors.purple.shade600,
    Colors.deepPurple.shade400,
    Colors.deepPurple.shade600,
    Colors.indigo.shade400,
    Colors.indigo.shade600,
    Colors.blue.shade400,
    Colors.blue.shade600,
    Colors.lightBlue.shade400,
    Colors.lightBlue.shade600,
    Colors.cyan.shade400,
    Colors.cyan.shade600,
    Colors.teal.shade400,
    Colors.teal.shade600,
    Colors.green.shade400,
    Colors.green.shade600,
    Colors.lightGreen.shade400,
    Colors.lightGreen.shade600,
    Colors.lime.shade400,
    Colors.lime.shade600,
    Colors.yellow.shade600,
    Colors.amber.shade600,
    Colors.orange.shade600,
    Colors.lime.shade400,
    Colors.lime.shade600,
    Colors.deepOrange.shade400,
    Colors.deepOrange.shade600,
    Colors.brown.shade400,
    Colors.brown.shade600,
    Colors.blueGrey.shade600,
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
    Color? color,
    double? limit,
  }) {
    if (id != null) this.id = id;
    if (budget != null) this.budget = budget;
    if (title != null) this.title = title;
    if (icon != null) this.icon = icon;
    if (color != null) this.color = color;
    if (limit != null) this.limit = limit;
  }

  factory Category({
    required String id,
    required Budget budget,
    required String title,
    required IconData icon,
    required Color color,
    required double budgetLimit,
  }) =>
      Category.lazy(
        id: id,
        budget: budget,
        title: title,
        icon: icon,
        color: color,
        limit: budgetLimit,
      );

  double get utilized {
    var sum = 0.0;
    for (final expense in expenses) {
      sum += expense.value;
    }
    return sum;
  }
}
