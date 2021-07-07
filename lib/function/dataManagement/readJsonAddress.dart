import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

Map datajson;

class AddressThailand {
  Future<void> init() async {
    final String response = await rootBundle.loadString('assets/thailand.json');
    Map _datajson = await json.decode(response);
    print("Load data address");
    // print(_datajson.toString());
    datajson = _datajson;
  }

  Future<List<String>> ProvinceKey() async {
    List<String> data = [];
    datajson.forEach((key, value) {
      data.add(key);
    });
    return data;
  }

  //tranfer key to value
  String ProvinceValue(
      {@required String provinceKey, @required String language}) {
    String data = datajson[provinceKey]['name'][language];
    return data;
  }

  Future<List<String>> DistrictKey({@required String provinceKey}) async {
    List<String> data = [];

    datajson[provinceKey]['amphoes'].forEach((key, value) {
      data.add(key);
    });
    // print(data);
    return data;
  }

  String DistrictValue(
      {@required String provinceKey,
      @required String districtKey,
      @required String language}) {
    String data =
        datajson[provinceKey]['amphoes'][districtKey]['name'][language];
    return data;
  }

  Future<List<String>> Sub_DistrictKey(
      {@required String provinceKey, @required String districtKey}) async {
    List<String> data = [];

    datajson[provinceKey]['amphoes'][districtKey]['tambons']
        .forEach((key, value) {
      data.add(key);
    });
    // print(data);
    return data;
  }

  String Sub_DistrictValue(
      {@required String provinceKey,
      @required String districtKey,
      @required String sub_districtKey,
      @required String language}) {
    String data = datajson[provinceKey]['amphoes'][districtKey]['tambons']
        [sub_districtKey]['name'][language];
    return data;
  }

  int Post_CodeValue(
      {@required String provinceKey,
      @required String districtKey,
      @required String sub_districtKey}) {
    int data = datajson[provinceKey]['amphoes'][districtKey]['tambons']
        [sub_districtKey]['zipcode'];
    return data;
  }
}

// Future<List<String>> thailandDataProvinceKey() async {
//   List<String> data = [];
//   String thaidlandString = await readJsonAddressThailand();
//   Map thailandJson = json.decode(thaidlandString);
// thailandJson.forEach((key, value) {
//   data.add(key);
// });
//   return data;
// }

// <Map<String, dynamic>>
