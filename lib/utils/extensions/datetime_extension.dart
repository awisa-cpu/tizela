extension TimeGetter on DateTime {
  String getHMTime() {
    final int hours = hour;
    final int minutes = minute;
    return "$hours:$minutes ${isAm() ? "AM" : "PM"}";
  }

  String getHMSTime() {
    final int hours = hour;
    final int minutes = minute;
    final int seconds = second;
    return "$hours:$minutes:$seconds ${isAm() ? "AM" : "PM"}";
  }

  bool isAm() => _am.contains(hour);

  String getFullDate() {
    final int years = year;
    final int months = month;
    final int days = day;
    final int hours = hour;
    final int minutes = minute;
    final int seconds = second;

    return "$years-$months-$days $hours:$minutes:$seconds ${isAm() ? "AM" : "PM"}";
  }

  static final _am = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
  ];
}
