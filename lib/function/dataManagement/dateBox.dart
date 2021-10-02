import 'package:flutter/cupertino.dart';

class DateBox {
  final int year, month, day, hour, min, sec;
  DateBox(
      {@required this.year,
      @required this.month,
      @required this.day,
      @required this.hour,
      @required this.min,
      this.sec});

  String ToString() {
    return this.sec == null
        ? "${this.hour}:${this.min} ${this.year}-${this.month}-${this.day}"
        : "${this.hour}:${this.min}: ${this.sec} ${this.year}-${this.month}-${this.day}";
  }

  String ToDateString() {
    return "${this.day} ${this.month} ${this.year}";
  }

  String ToTimeString() {
    return this.sec == null
        ? "${this.hour}:${this.min}"
        : "${this.hour}:${this.min}: ${this.sec} ";
  }

  DateTime datetime() {
    return DateTime(this.year, this.month, this.day, this.hour, this.min,
        this.sec == null ? 0 : this.sec);
  }
}

Future<DateBox> DateStringTransformInt({String dateString}) async {
  String yearSreing = dateString.substring(0, 4);
  String monthSreing = dateString.substring(5, 7);
  String daySreing = dateString.substring(8, 10);
  String hourSreing = dateString.substring(11, 13);
  String minSreing = dateString.substring(14, 16);
  int yearInt = int.parse(yearSreing);
  int monthInt = int.parse(monthSreing);
  int dayInt = int.parse(daySreing);
  int hourInt = int.parse(hourSreing);
  int minInt = int.parse(minSreing);
  return DateBox(
      year: yearInt, month: monthInt, day: dayInt, hour: hourInt, min: minInt);
}
