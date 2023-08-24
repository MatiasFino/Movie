import 'package:dartz/dartz.dart';
import 'package:flutter_projects/domain/entity/movie.dart';
import 'package:flutter_projects/domain/use_cases/implementations/use_case_impl.dart';
import 'package:flutter_projects/domain/use_cases/use_case_interface.dart';
import 'package:flutter_projects/presentation/bloc/bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUseCase extends Mock implements UseCases {}

void main() {

  final mockUseCase = MockUseCase();

  when(() => mockUseCase.fetchGenres())
      .thenAnswer((_) async => right({}));

  group('Popular Movies Use Case Testing',()
  {
    late BlocImpl bloc;

    setUp(() {
      bloc = BlocImpl(useCases: mockUseCase);
    } );

    test('bloc stream should contain a list of Movie Entity as result of the use case fetchPopularMovies()', () async {


      when(() => mockUseCase.fetchPopularMovies())
          .thenAnswer((_) async => right([MovieEntity.defaultMovie()]));

      bloc.fetchPopularMovies();

      expect(bloc.movieStream, emits([MovieEntity.defaultMovie()]));
    });

    test('bloc stream should contain an empty list if nothing is retrieved from the use case', () async {
      when(() => mockUseCase.fetchPopularMovies())
          .thenAnswer((_) async => right([]));
      bloc.fetchPopularMovies();

      expect(bloc.movieStream, emits([]));
    });

    test('bloc stream should contain a Failure if there was a problem on the way to the API', () async {
      when(() => mockUseCase.fetchPopularMovies())
          .thenAnswer((_) async => left(Failure(404, "Failure testing")));
      bloc.fetchPopularMovies();

      expect(bloc.movieStream, emitsError(Failure(404, "Failure testing")));
    });

  });


  group('Upcoming Movies Use Case Testing',()
  {

    late BlocImpl bloc;

    setUp(() {
      bloc = BlocImpl(useCases: mockUseCase);
    } );

    test('bloc stream should contain a list of Movie Entity as result of the use case run()', () async {

      when(() => mockUseCase.fetchUpcomingMovies())
          .thenAnswer((_) async => right<Failure, List<MovieEntity>>([MovieEntity.defaultMovie()]));
      bloc.fetchUpcomingMovies();

      expect(bloc.movieStream, emits([MovieEntity.defaultMovie()]));
    });

    test('bloc stream should contain an empty list if nothing is retrieved from the use case', () async {
      when(() => mockUseCase.fetchUpcomingMovies())
          .thenAnswer((_) async => right([]));
      bloc.fetchUpcomingMovies();

      expect(bloc.movieStream, emits([]));
    });

    test('bloc stream should contain a Failure if there was a problem on the way to the API', () async {
      when(() => mockUseCase.fetchUpcomingMovies())
          .thenAnswer((_) async => left(Failure(404, "Failure testing")));
      bloc.fetchUpcomingMovies();

      expect(bloc.movieStream, emitsError(Failure(404, "Failure testing")));
    });

  });

  group('Now Playing Movies Use Case Testing',()
  {

    late BlocImpl bloc;

    setUp(() {
      bloc = BlocImpl(useCases: mockUseCase);
    } );

    test('bloc stream should contain a list of Movie Entity as result of the use case run()', () async {

      when(() => mockUseCase.fetchNowPlayingMovies())
          .thenAnswer((_) async => right<Failure, List<MovieEntity>>([MovieEntity.defaultMovie()]));
      bloc.fetchNowPlayingMovies();

      expect(bloc.movieStream, emits([MovieEntity.defaultMovie()]));
    });

    test('bloc stream should contain an empty list if nothing is retrieved from the use case', () async {
      when(() => mockUseCase.fetchNowPlayingMovies())
          .thenAnswer((_) async => right([]));
      bloc.fetchNowPlayingMovies();

      expect(bloc.movieStream, emits([]));
    });

    test('bloc stream should contain a Failure if there was a problem on the way to the API', () async {
      when(() => mockUseCase.fetchNowPlayingMovies())
          .thenAnswer((_) async => left(Failure(404, "Failure testing")));
      bloc.fetchNowPlayingMovies();

      expect(bloc.movieStream, emitsError(Failure(404, "Failure testing")));
    });

  });


  group('Now Playing Movies Use Case Testing',()
  {

    late BlocImpl bloc;

    setUp(() {
      bloc = BlocImpl(useCases: mockUseCase);
    } );

    test('bloc stream should contain a list of Movie Entity as result of the use case run()', () async {

      when(() => mockUseCase.fetchTopRatedMovies())
          .thenAnswer((_) async => right<Failure, List<MovieEntity>>([MovieEntity.defaultMovie()]));
      bloc.fetchTopRatedMovies();

      expect(bloc.movieStream, emits([MovieEntity.defaultMovie()]));
    });

    test('bloc stream should contain an empty list if nothing is retrieved from the use case', () async {
      when(() => mockUseCase.fetchTopRatedMovies())
          .thenAnswer((_) async => right([]));
      bloc.fetchTopRatedMovies();

      expect(bloc.movieStream, emits([]));
    });

    test('bloc stream should contain a Failure if there was a problem on the way to the API', () async {
      when(() => mockUseCase.fetchTopRatedMovies())
          .thenAnswer((_) async => left(Failure(404, "Failure testing")));
      bloc.fetchTopRatedMovies();

      expect(bloc.movieStream, emitsError(Failure(404, "Failure testing")));
    });

  });

}
