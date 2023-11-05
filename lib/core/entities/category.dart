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
    '0': LineIcons.pizzaSlice,
    '1': LineIcons.shoppingCart,
    '2': LineIcons.tShirt,
    '3': LineIcons.moneyBill,
    '4': LineIcons.home,
    '5': LineIcons.car,
    '6': LineIcons.compass,
    '7': LineIcons.plane,
    '8': LineIcons.heartbeat,
    '9': LineIcons.gamepad,
    '10': LineIcons.wrench,
    '11': LineIcons.gift,
    '12': LineIcons.firstAid,
    '13': LineIcons.wineGlass,
    '14': LineIcons.dog,
    '15': LineIcons.cat,
    '16': LineIcons.wallet,
    '17': LineIcons.music,
    '18': LineIcons.graduationCap,
    '19': LineIcons.creditCard,
    '20': LineIcons.fileInvoiceWithUsDollar,
    '21': LineIcons.userFriends,
    '22': LineIcons.piggyBank,
    '23': LineIcons.cut,
    '24': LineIcons.book,
    '25': LineIcons.umbrellaBeach,
    '26': LineIcons.placeOfWorship,
    '27': LineIcons.ship,
    '28': LineIcons.star,
    '29': LineIcons.building,
    '30': LineIcons.phone,
    '31': LineIcons.tree,
    '32': LineIcons.lock,
    '33': LineIcons.mapPin,
    '34': LineIcons.child,
    '35': LineIcons.medal,
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
