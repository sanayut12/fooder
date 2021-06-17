import 'package:flutter/services.dart';
import 'dart:convert';

class AddressThailand {
  Map datajson;
  Future<void> init() async {
    final String response = await rootBundle.loadString('assets/thailand.json');
    Map _datajson = await json.decode(response);
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
  String ProvinceValue({String provinceKey, String language}) {
    String data = datajson[provinceKey]['name'][language];
    return data;
  }

  Future<List<String>> DistrictKey({String provinceKey}) async {
    List<String> data = [];

    datajson[provinceKey]['amphoes'].forEach((key, value) {
      data.add(key);
    });
    // print(data);
    return data;
  }

  String DistrictValue(
      {String provinceKey, String districtKey, String language}) {
    String data =
        datajson[provinceKey]['amphoes'][districtKey]['name'][language];
    return data;
  }

  Future<List<String>> Sub_DistrictKey(
      {String provinceKey, String districtKey}) async {
    List<String> data = [];

    datajson[provinceKey]['amphoes'][districtKey]['tambons']
        .forEach((key, value) {
      data.add(key);
    });
    // print(data);
    return data;
  }

  String Sub_DistrictValue(
      {String provinceKey,
      String districtKey,
      String sub_districtKey,
      String language}) {
    String data = datajson[provinceKey]['amphoes'][districtKey]['tambons']
        [sub_districtKey]['name'][language];
    return data;
  }

  int Post_CodeValue(
      {String provinceKey, String districtKey, String sub_districtKey}) {
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
