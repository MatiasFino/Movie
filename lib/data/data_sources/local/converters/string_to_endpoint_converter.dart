import 'dart:convert';

import 'package:floor/floor.dart';

import '../../../../core/utils/data_state.dart';

class EndPointListConverter extends TypeConverter<List<EndPoint>, String> {
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
