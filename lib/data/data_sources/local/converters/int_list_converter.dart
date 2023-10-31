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
