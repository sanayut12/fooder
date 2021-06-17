class DateBox {
  final int year, month, day, hour, min;
  DateBox({this.year, this.month, this.day, this.hour, this.min});
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
