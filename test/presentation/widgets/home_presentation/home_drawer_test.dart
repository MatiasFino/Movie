import 'package:flutter/material.dart';
import 'package:flutter_projects/core/utils/ui_constants/keys.dart';
import 'package:flutter_projects/presentation/view/home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomeDrawer shows the correct options', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(home: HomeView()));
    await tester.pumpAndSettle();

    final drawerIcon = await find.byIcon(Icons.menu);
    await tester.tap(drawerIcon);
    await tester.pumpAndSettle();

    expect(find.byKey(homeDrawerKey), findsOneWidget);

    expect(
      find.byKey(nowPlayingTailKey),
      findsOneWidget,
    );

    expect(
      find.byKey(upcomingTailKey),
      findsOneWidget,
    );

    expect(
      find.byKey (topRatedTailKey),
      findsOneWidget,
    );

    expect(
      find.byKey(popularTailKey),
      findsOneWidget,
    );

    expect(
      find.byKey(homeTailKey),
      findsOneWidget,
    );
   });

}
