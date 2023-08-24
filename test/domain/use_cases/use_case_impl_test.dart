import 'package:dartz/dartz.dart';
import 'package:flutter_projects/domain/entity/movie.dart';
import 'package:flutter_projects/domain/repository/i_movie_repository.dart';
import 'package:flutter_projects/domain/use_cases/implementations/use_case_impl.dart';
import 'package:flutter_projects/domain/use_cases/use_case_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {

  final MockMovieRepository mockMovieRepository = MockMovieRepository();
  final UseCases useCase = UseCases(repository: mockMovieRepository);


  group('Upcoming Movies Use Case Tests', () {

    const EndPoint endPoint = EndPoint.UPCOMING;

    test('GetUpcomingMoviesUseCaseImpl should return a list of movies',
        () async {
      when(
        () => mockMovieRepository.getMovies(endPoint),
      ).thenAnswer(
        (_) async => Right([MovieEntity.defaultMovie()]),
      );

      final result = await useCase.fetchUpcomingMovies();
      expect(result, isA<Right<Failure, List<MovieEntity>>>());
      expect(result.fold((left) => left, (right) => right), [MovieEntity.defaultMovie()]);
    });

    test('GetUpcomingMoviesUseCaseImpl should return an empty list', () async {
      when(
        () => mockMovieRepository.getMovies(endPoint),
      ).thenAnswer(
        (_) async => const Right([]),
      );

      final result = await useCase.fetchUpcomingMovies();
      expect(result, isA<Right<Failure, List<MovieEntity>>>());
      expect(result.fold((l) => l, (r) => r), []);
    });

    test('GetUpcomingMoviesUseCaseImpl should return Failure', () async {
      when(
        () => mockMovieRepository.getMovies(endPoint),
      ).thenAnswer(
        (_) async => Left(Failure(404, "There has been an error"),),
      );

      final result = await useCase.fetchUpcomingMovies();
      expect(result, isA<Left<Failure, List<MovieEntity>>>());
      expect(result.fold((l) => l, (r) => r),
          Failure(404, "There has been an error"),);
    });
  });

  group('Now Playing Movies Use Case Tests', () {

    const EndPoint endPoint = EndPoint.NOW_PLAYING;


    test('GetNowPlayingMoviesUseCaseImpl should return a list of movies',
        () async {
      when(
        () => mockMovieRepository.getMovies(endPoint),
      ).thenAnswer(
        (_) async => Right([MovieEntity.defaultMovie()]),
      );

      final result = await useCase.fetchNowPlayingMovies();
      expect(result, isA<Right<Failure, List<MovieEntity>>>());
      expect(result.fold((l) => l, (r) => r), [MovieEntity.defaultMovie()]);
    });

    test('GetNowPlayingMoviesUseCaseImpl should return an empty list', () async {
      when(
        () => mockMovieRepository.getMovies(endPoint),
      ).thenAnswer(
        (_) async => const Right([]),
      );

      final result = await useCase.fetchNowPlayingMovies();
      expect(result, isA<Right<Failure, List<MovieEntity>>>());
      expect(result.fold((l) => l, (r) => r), []);
    });

    test('GetNowPlayingMoviesUseCaseImpl should return Failure', () async {
      when(
        () => mockMovieRepository.getMovies(endPoint),
      ).thenAnswer(
        (_) async => Left(Failure(404, "There has been an error"),),
      );

      final result = await useCase.fetchNowPlayingMovies();
      expect(result, isA<Left<Failure, List<MovieEntity>>>());
      expect(result.fold((l) => l, (r) => r),
          Failure(404, "There has been an error"),);
    });
  });


  group('Top Rated Movies Use Case Tests', () {
    const EndPoint endPoint = EndPoint.TOP_RATED;


    test('GetTopRatedMoviesUseCaseImpl should return a list of movies',
            () async {
          when(
                () => mockMovieRepository.getMovies(endPoint),
          ).thenAnswer(
                (_) async => Right([MovieEntity.defaultMovie()]),
          );

          final result = await useCase.fetchTopRatedMovies();
          expect(result, isA<Right<Failure, List<MovieEntity>>>());
          expect(result.fold((l) => l, (r) => r), [MovieEntity.defaultMovie()]);
        });

    test('GetTopRatedMoviesUseCaseImpl should return an empty list', () async {
      when(
            () => mockMovieRepository.getMovies(endPoint),
      ).thenAnswer(
            (_) async => const Right([]),
      );

      final result = await useCase.fetchTopRatedMovies();
      expect(result, isA<Right<Failure, List<MovieEntity>>>());
      expect(result.fold((l) => l, (r) => r), []);
    });

    test('GetTopRatedMoviesUseCaseImpl should return Failure', () async {
      when(
            () => mockMovieRepository.getMovies(endPoint),
      ).thenAnswer(
            (_) async => Left(Failure(404, "There has been an error"),),
      );

      final result = await useCase.fetchTopRatedMovies();
      expect(result, isA<Left<Failure, List<MovieEntity>>>());
      expect(result.fold((l) => l, (r) => r),
        Failure(404, "There has been an error"),);
    });
  });

  group('Popular Movies Use Case Tests', () {
    const EndPoint endPoint = EndPoint.POPULAR;

    test('GetPopularMoviesUseCaseImpl should return a list of movies',
            () async {
          when(
                () => mockMovieRepository.getMovies(endPoint),
          ).thenAnswer(
                (_) async => Right([MovieEntity.defaultMovie()]),
          );

          final result = await useCase.fetchPopularMovies();
          expect(result, isA<Right<Failure, List<MovieEntity>>>());
          expect(result.fold((l) => l, (r) => r), [MovieEntity.defaultMovie()]);
        });

    test('GetPopularMoviesUseCaseImpl should return an empty list', () async {
      when(
            () => mockMovieRepository.getMovies(endPoint),
      ).thenAnswer(
            (_) async => const Right([]),
      );

      final result = await useCase.fetchPopularMovies();
      expect(result, isA<Right<Failure, List<MovieEntity>>>());
      expect(result.fold((l) => l, (r) => r), []);
    });

    test('GetPopularMoviesUseCaseImpl should return Failure', () async {
      when(
            () => mockMovieRepository.getMovies(endPoint),
      ).thenAnswer(
            (_) async => Left(Failure(404, "There has been an error"),),
      );

      final result = await useCase.fetchPopularMovies();
      expect(result, isA<Left<Failure, List<MovieEntity>>>());
      expect(result.fold((l) => l, (r) => r),
        Failure(404, "There has been an error"),);
    });
  });

  group('Movies Use Case Tests', () {
    const EndPoint endPoint = EndPoint.POPULAR;

    test('GetPopularMoviesUseCaseImpl should return a list of movies',
            () async {
          when(
                () => mockMovieRepository.getMovies(endPoint),
          ).thenAnswer(
                (_) async => Right([MovieEntity.defaultMovie()]),
          );

          final result = await useCase.fetchPopularMovies();
          expect(result, isA<Right<Failure, List<MovieEntity>>>());
          expect(result.fold((l) => l, (r) => r), [MovieEntity.defaultMovie()]);
        });

    test('GetPopularMoviesUseCaseImpl should return an empty list', () async {
      when(
            () => mockMovieRepository.getMovies(endPoint),
      ).thenAnswer(
            (_) async => const Right([]),
      );

      final result = await useCase.fetchPopularMovies();
      expect(result, isA<Right<Failure, List<MovieEntity>>>());
      expect(result.fold((l) => l, (r) => r), []);
    });

    test('GetPopularMoviesUseCaseImpl should return Failure', () async {
      when(
            () => mockMovieRepository.getMovies(endPoint),
      ).thenAnswer(
            (_) async => Left(Failure(404, "There has been an error"),),
      );

      final result = await useCase.fetchPopularMovies();
      expect(result, isA<Left<Failure, List<MovieEntity>>>());
      expect(result.fold((l) => l, (r) => r),
        Failure(404, "There has been an error"),);
    });
  });

}
