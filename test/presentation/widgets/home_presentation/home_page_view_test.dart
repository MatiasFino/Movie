import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_projects/domain/entity/movie.dart';
import 'package:flutter_projects/presentation/bloc/bloc.dart';
import 'package:flutter_projects/presentation/view/home.dart';
import 'package:flutter_projects/presentation/widgets/general_widgets/movie_container.dart';
import 'package:flutter_projects/presentation/widgets/home_presentation/home_page_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'home_page_view_display_test.dart';

class MockBloc extends Mock implements Bloc {}
class FakeUri extends Fake implements Uri {}
class MockContainer extends Mock implements MovieListContainer {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return super.toString();
  }
}

void main() {

  late final MockBloc mockBloc;
  late final MockClient mockClient;
  late final MockContainer mockContainer;

  setUp(() {
    registerFallbackValue(FakeUri());
    mockBloc = MockBloc();
    mockClient = MockClient();
    mockContainer = MockContainer();
  });

  tearDown(() {});

  testWidgets('MoviePageView displays movies', (WidgetTester tester) async {

    final movies = [
      MovieEntity.defaultMovie(),
      MovieEntity.defaultMovie(),
    ];

    final StreamController<List<MovieEntity>> streamController =
        StreamController<List<MovieEntity>>();
    streamController.add(movies);

    when(() => mockClient.get(any())).thenAnswer(((_) async {
      return Response("mocked answer", 200);
    }));

    when(() => mockBloc.movieStream).thenAnswer((_) {
      return streamController.stream;
    });


    when(() => mockContainer.image).thenAnswer((_) {
      return Image.memory(Uint8List(123123131));
    });

    when(() => mockBloc.getGenre(12)).thenAnswer((_) => "genreTest");
    when(() => mockBloc.getGenre(14)).thenAnswer((_) => "genreTest");
    when(() => mockBloc.getGenre(16)).thenAnswer((_) => "genreTest");
    when(() => mockBloc.getGenre(36)).thenAnswer((_) => "genreTest");

    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MoviePageView(
                bloc: mockBloc,
                containerType: MovieContainerType.BASIC,
                movieCategory: MovieCategory.POPULAR,
              ),
            ),
          ),
        ),
      );

    await tester.pumpAndSettle();

    expect(find.byType(MoviePageView), findsOneWidget);

    expect(find.byType(PageView), findsOneWidget);
    expect(find.byType(BasicMovieContainer), findsNWidgets(movies.length));
  });
}
