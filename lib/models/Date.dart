class Date {
  late int day;
  late int month;
  late int year;

  Date({
    required this.day,
    required this.month,
    required this.year,
  });

  @override
  String toString() {
    return '$day-$month-$year';
  }
}
