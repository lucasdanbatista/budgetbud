import 'dart:ui';

import 'mapper.dart';

class ColorMapper implements Mapper<String, Color> {
  @override
  Color map(String it) => Color(int.parse(it));
}
