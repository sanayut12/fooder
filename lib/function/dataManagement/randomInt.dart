import 'dart:math' as math;

Future<int> RandomInt(int len) async {
  String number = "";
  for (int i = 0; i < len; i++) {
    number += math.Random().nextInt(9).toString();
  }
  return int.parse(number);
}
