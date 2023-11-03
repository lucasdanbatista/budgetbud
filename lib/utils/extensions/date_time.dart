import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  operator <(DateTime other) => isBefore(other);

  operator >(DateTime other) => isAfter(other);

  operator <=(DateTime other) => this < other || isAtSameMomentAs(other);

  operator >=(DateTime other) => this > other || isAtSameMomentAs(other);

  bool isSameDay(DateTime other) => DateUtils.isSameDay(this, other);

  DateTime get dateOnly => DateUtils.dateOnly(this);
}
