import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../domain/entity/movie.dart';
import '../local_DAOs/local_dao.dart';
import 'converters/int_list_converter.dart';
import 'converters/string_to_endpoint_converter.dart';

part 'floor_data_base.g.dart';

@TypeConverters([IntListConverter, EndPointListConverter])
@Database(version: 1, entities: [MovieEntity])
abstract class AppDatabase extends FloorDatabase {
  MovieDao get movieDao;
}
