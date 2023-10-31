import '../../../domain/entity/movie.dart';
import 'floor_data_base.dart';

class DBController {

  late final  database;
  late final movieDao;
  final movie = MovieEntity.defaultMovie();

  DBController(){
    _initialize();
  }

  void _initialize() async{
    database = await $FloorAppDatabase.databaseBuilder('floor_data_base.dart').build();
    movieDao = database.movieDao;
    await movieDao.insertMovie(movie);
    print ('encontre esto: '+ await movieDao.findMovieById(1));
  }
}
