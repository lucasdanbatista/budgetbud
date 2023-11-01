import 'dart:ui';

class ColorMapper {
  Color mapToColor(String it) => Color(int.parse(it));

  String mapToString(Color it) => it.value.toString();
}
