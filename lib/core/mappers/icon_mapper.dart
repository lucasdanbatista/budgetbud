import 'package:flutter/material.dart';

import 'mapper.dart';

class IconMapper implements Mapper<String, IconData> {
  @override
  IconData map(String it) => switch (it) {
        'ic_home_outlined' => Icons.home_outlined,
        'ic_restaurant' => Icons.restaurant,
        'ic_beach_access_outlined' => Icons.beach_access_outlined,
        'ic_credit_card' => Icons.credit_card,
        'ic_shopping_cart_outlined' => Icons.shopping_cart_outlined,
        'ic_directions_car_outlined' => Icons.directions_car_outlined,
        'ic_health_and_safety_outlined' => Icons.health_and_safety_outlined,
        'ic_book_outlined' => Icons.book_outlined,
        _ => throw UnsupportedError('$it can not be mapped to any knew icon')
      };
}
