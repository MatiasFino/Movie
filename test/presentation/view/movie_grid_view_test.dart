import 'dart:async';

import 'package:flutter_projects/core/utils/ui_constants/keys.dart';
import 'package:flutter_projects/domain/entity/movie.dart';
import 'package:flutter_projects/presentation/bloc/bloc.dart';
import 'package:flutter_projects/presentation/view/home.dart';
import 'package:flutter_projects/presentation/view/movie_grid_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MockBloc extends Mock implements Bloc {}
class MockClient extends Mock implements http.Client{}
class FakeUri extends Fake implements Uri {}

void main() {
  late final MockBloc mockBloc;

  setUp(() {
    registerFallbackValue(FakeUri());
  });
  tearDown(() {});

  MockClient mockHttpClient = MockClient();

  group('MovieGridView Widget Test', () {
    testWidgets('Renders loading indicator when waiting for data',
        (tester) async {
      mockBloc = MockBloc();

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

      final mockBloc = MockBloc();

      final StreamController<List<MovieEntity>> streamController =
          await StreamController<List<MovieEntity>>()
            ..add(movies);

      when(() => mockHttpClient.get(any())).thenAnswer(((_) async {
        return http.Response("mocked answer", 200);
      }));

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
