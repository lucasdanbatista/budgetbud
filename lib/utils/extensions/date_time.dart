extension DateTimeExtension on DateTime {
  operator <(DateTime other) => isBefore(other);

  operator >(DateTime other) => isAfter(other);
}
