import 'package:flutter/material.dart';

import 'mapper.dart';

class IconMapper implements Mapper<String, IconData> {
  @override
  IconData map(String it) => switch (it) {
        'ic_home' => Icons.home,
        'ic_restaurant' => Icons.restaurant,
        _ => throw UnsupportedError('$it can not be mapped to any knew icon')
      };
}
