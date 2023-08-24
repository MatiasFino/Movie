import 'package:dartz/dartz.dart';
import 'package:flutter_projects/domain/use_cases/implementations/use_case_impl.dart';
import 'package:flutter_projects/domain/use_cases/use_case_interface.dart';
import 'package:flutter_projects/presentation/bloc/bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUseCase extends Mock implements UseCases {}

void main() {

  final MockUseCase mockUseCase = MockUseCase();

  group('Bloc Genres Testing',()

  {
    test('getGenres on success should fetch all the genres and store them in the genres variable inside the bloc', () async {
      const Map<int, String> expectedGenres = {1: "Comedy", 2: "Horror", 3: "Thriller"};

      when(() => mockUseCase.fetchGenres()).thenAnswer((_) async {
        return const Right(expectedGenres);
      });

      final bloc = await BlocImpl(useCases: mockUseCase);

      expect(bloc.genres, equals(expectedGenres));
    });

    test('getGenres on failure should store an empty list on genres', () async {

      when(() => mockUseCase.fetchGenres()).thenAnswer((_) async {
        return Left(Failure(404, "Api not Available"));
      });

      final bloc = await BlocImpl(useCases: mockUseCase);

      expect(bloc.genres, equals({}));
    });
});
}
