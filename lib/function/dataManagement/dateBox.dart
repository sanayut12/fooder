import 'dart:convert';

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

  int getYear() {
    return this.year;
  }

  int getMonth() {
    return this.month;
  }

  int getDay() {
    return this.day;
  }

  int getHour() {
    return this.hour;
  }

  int getMinute() {
    return this.min;
  }

  int GetSecond() {
    return this.sec;
  }
}

DateBox DateStringTransformInt({String dateString}) {
  String yearString = dateString.substring(0, 4);
  String monthString = dateString.substring(5, 7);
  String dayString = dateString.substring(8, 10);
  String hourString = dateString.substring(11, 13);
  String minString = dateString.substring(14, 16);
  String secString = dateString.substring(18, 19);
  int yearInt = int.parse(yearString);
  int monthInt = int.parse(monthString);
  int dayInt = int.parse(dayString);
  int hourInt = int.parse(hourString);
  int minInt = int.parse(minString);
  int secInt = int.parse(secString);
  return DateBox(
      year: yearInt,
      month: monthInt,
      day: dayInt,
      hour: hourInt,
      min: minInt,
      sec: secInt);
}

Future<DateBox> StringToDateBox({@required String string}) async {
  Map date = json.decode(string);

  int year = date['year'];
  int month = date['month'];
  int day = date['day'];
  int hour = date['hour'];
  int min = date['min'];
  int sec = date['sec'];
  return DateBox(
      year: year, month: month, day: day, hour: hour, min: min, sec: sec);
}

DateBox MapDataToDateBox({@required Map data}) {
  int year = data['year'];
  int month = data['month'];
  int day = data['day'];
  int hour = data['hour'];
  int min = data['min'];
  int sec = data['sec'];

  if (sec == null) {
    return DateBox(year: year, month: month, day: day, hour: hour, min: min);
  } else {
    return DateBox(
        year: year, month: month, day: day, hour: hour, min: min, sec: sec);
  }
}
