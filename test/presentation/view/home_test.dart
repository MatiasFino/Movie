import 'package:flutter/material.dart';
import 'package:flutter_projects/presentation/view/home.dart';
import 'package:flutter_projects/presentation/widgets/home_presentation/home_page_view_display.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomeView should render correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: HomeView(),
    ),);

    await tester.pumpAndSettle();
    expect(find.byType(Scaffold), findsOneWidget);

    final appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);
    final appBarWidget = tester.widget<AppBar>(appBar);
    expect(appBarWidget.elevation, 0);

    final homePageViewDisplay = find.byType(HomePageViewDisplay);
    expect(homePageViewDisplay, findsOneWidget);

  });
}
