import 'package:floor/floor.dart';

import '../../../domain/entity/movie.dart';

@dao
abstract class MovieDao {

@Query('SELECT * FROM Movie WHERE id = :id')
Stream<MovieEntity?> findMovieById(int id);

@Query('SELECT * FROM Movie WHERE category = :category')
Stream<MovieEntity?> findMoviesByCategory(String category);

}
