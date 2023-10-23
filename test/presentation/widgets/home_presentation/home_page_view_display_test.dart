import 'package:flutter/material.dart';
import 'package:flutter_projects/presentation/widgets/home_presentation/home_page_view.dart';
import 'package:flutter_projects/presentation/widgets/home_presentation/home_page_view_display.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('HomePageViewDisplay displays movie categories', (WidgetTester tester) async {

    await mockNetworkImagesFor(() => tester.pumpWidget(MaterialApp(title: "HomePageView" ,home: HomePageViewDisplay())));
    await tester.pumpAndSettle();

    expect(find.byType(HomePageViewDisplay), findsOneWidget);

    expect(find.byKey(const Key("Popular")), findsOneWidget);
    expect(find.byKey(const Key("Top Rated")), findsOneWidget);
    expect(find.byKey(const Key("Upcoming")), findsOneWidget);
    expect(find.byKey(const Key("Now Playing")), findsOneWidget);

    expect(find.byType(MoviePageView), findsNWidgets(4));
  });
}
