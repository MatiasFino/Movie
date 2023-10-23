import 'package:flutter/material.dart';
import 'package:flutter_projects/core/utils/ui_constants/keys.dart';
import 'package:flutter_projects/presentation/widgets/home_presentation/home_page_view.dart';
import 'package:flutter_projects/presentation/widgets/home_presentation/home_page_view_display.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MockClient extends Mock implements Client {}
class FakeUri extends Fake implements Uri {}

void main() {

  setUp(() {
    registerFallbackValue(FakeUri());
  });
  tearDown(() {});

  testWidgets('HomePageViewDisplay displays movie categories',

      (WidgetTester tester) async {
    final MockClient mockClient = MockClient();

    when(() => mockClient.get(any())).thenAnswer(
      ((_) async {
        return Response("mocked answer", 200);
      }),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: await mockNetworkImagesFor(() => HomePageViewDisplay()),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(HomePageViewDisplay), findsOneWidget);
    expect(find.byKey(homePageViewPopularKey), findsOneWidget);
    expect(find.byType(MoviePageView), findsWidgets);

    expect(find.byType(MoviePageView), findsWidgets);
  });
}
