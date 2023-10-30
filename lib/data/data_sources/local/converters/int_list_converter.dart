import 'dart:convert';

import 'package:floor/floor.dart';

import '../../../../core/utils/data_state.dart';

class IntListConverter extends TypeConverter<List<int>, String> {
  @override
  List<int> decode(String databaseValue) {
    final List<dynamic> parsedList = json.decode(databaseValue);
    return parsedList.cast<int>();
  }

  @override
  String encode(List<int> value) {
    return json.encode(value);
  }
}

class ListEndPointConverter extends TypeConverter<List<EndPoint>, String> {
  @override
  List<EndPoint> decode(String databaseValue) {
    final List<String> parsedList = json.decode(databaseValue);
    return parsedList.map((stringCategory) => EndPointExtension.fromString(stringCategory)).toList();
  }

  @override
  String encode(List<EndPoint> value) {
    return json.encode(value.map((category) => category.stringValue));
  }
}
