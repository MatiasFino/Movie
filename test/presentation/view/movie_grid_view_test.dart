import 'dart:async';

import 'package:flutter_projects/core/utils/ui_constants/keys.dart';
import 'package:flutter_projects/domain/entity/movie.dart';
import 'package:flutter_projects/presentation/bloc/bloc.dart';
import 'package:flutter_projects/presentation/view/home.dart';
import 'package:flutter_projects/presentation/view/movie_grid_view.dart';
import 'package:flutter_projects/presentation/widgets/general_widgets/movie_container.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MockBloc extends Mock implements Bloc {}

class MockContainer extends Mock implements MovieListContainer {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return super.toString();
  }
}

void main() {
  late final MockBloc mockBloc;

  group('MovieGridView Widget Test', () {
    setUp(() {
      mockBloc = MockBloc();
    });

    testWidgets('Renders loading indicator when waiting for data',
        (tester) async {
      when(() => mockBloc.movieStream)
          .thenAnswer((_) => StreamController<List<MovieEntity>>().stream);

      await tester.pumpWidget(
        MaterialApp(
          home: Navigator(
            onGenerateRoute: (_) {
              return MaterialPageRoute<Widget>(
                builder: (_) => MovieGridView(bloc: mockBloc),
                settings:
                    const RouteSettings(arguments: MovieCategory.TOP_RATED),
              );
            },
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Renders movie containers when data is available',
        (tester) async {
      final movies = [
        MovieEntity.defaultMovie(),
        MovieEntity.defaultMovie(),
      ];

      final StreamController<List<MovieEntity>> streamController =
          StreamController<List<MovieEntity>>();
      streamController.add(movies);

      when(() => mockBloc.movieStream)
          .thenAnswer((_) => streamController.stream);

      when(() => mockBloc.getGenre(12)).thenAnswer((_) => "genreTest");
      when(() => mockBloc.getGenre(14)).thenAnswer((_) => "genreTest");
      when(() => mockBloc.getGenre(16)).thenAnswer((_) => "genreTest");
      when(() => mockBloc.getGenre(36)).thenAnswer((_) => "genreTest");

      await mockNetworkImagesFor(
        () => MaterialApp(
          home: Navigator(
            onGenerateRoute: (_) {
              return MaterialPageRoute<Widget>(
                builder: (_) => MovieGridView(bloc: mockBloc),
                settings:
                    const RouteSettings(arguments: MovieCategory.TOP_RATED),
              );
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.byKey(gridViewBuilderKey),
        findsOneWidget,
      );
    });

    testWidgets('Renders throws error on error data ', (tester) async {
      final StreamController<List<MovieEntity>> streamController =
          StreamController<List<MovieEntity>>();
      streamController.addError("error");

      when(() => mockBloc.movieStream)
          .thenAnswer((_) => streamController.stream);

      await mockNetworkImagesFor(
        () => tester.pumpWidget(
          MaterialApp(
            home: Navigator(
              onGenerateRoute: (_) {
                return MaterialPageRoute<Widget>(
                  builder: (_) => MovieGridView(bloc: mockBloc),
                  settings:
                      const RouteSettings(arguments: MovieCategory.TOP_RATED),
                );
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.byKey(gridViewSnapshotErrorKey),
        findsOneWidget,
      );
    });
  });
}
