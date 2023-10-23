import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_projects/domain/entity/movie.dart';
import 'package:flutter_projects/presentation/bloc/bloc.dart';
import 'package:flutter_projects/presentation/view/home.dart';
import 'package:flutter_projects/presentation/widgets/general_widgets/movie_container.dart';
import 'package:flutter_projects/presentation/widgets/home_presentation/home_page_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';


class MockBloc extends Mock implements Bloc {}

void main() {
  late final MockBloc mockBloc;

  setUp(() => mockBloc = MockBloc());

  testWidgets('MoviePageView displays movies', (WidgetTester tester) async {
    final movies = [
      MovieEntity.defaultMovie(),
      MovieEntity.defaultMovie(),
    ];

    final StreamController<List<MovieEntity>> streamController =
        StreamController<List<MovieEntity>>();
    streamController.add(movies);

    when(() => mockBloc.movieStream).thenAnswer((_) {
      return streamController.stream;
    });

    when(() => mockBloc.getGenre(12)).thenAnswer((_) => "genreTest");
    when(() => mockBloc.getGenre(14)).thenAnswer((_) => "genreTest");
    when(() => mockBloc.getGenre(16)).thenAnswer((_) => "genreTest");
    when(() => mockBloc.getGenre(36)).thenAnswer((_) => "genreTest");

    await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: await mockNetworkImagesFor(() =>
              MoviePageView(
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

//    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    expect(find.byType(PageView), findsOneWidget);
    expect(find.byType(BasicMovieContainer), findsNWidgets(movies.length));
  });
}
