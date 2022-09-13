import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_app/src/http/mock_client.dart';
import 'package:form_app/main.dart';

void main() {
  testWidgets('sign in', (tester) async {
    await _startapp(tester, 'root', 'password');
    // Check if any solid favorite icon shows up.
      expect(find.byIcon(Icons.school), findsWidgets);

      // Tap the first item's icon to add it to favorites.
      await tester.tap(find.byIcon(Icons.school).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify if the appropriate message is shown.
      expect(find.text('Infinite List'), findsOneWidget);
  });
   testWidgets('Infinite list smoke test', (tester) async {
    await _startapp(tester, 'root', 'password');
    // Tap the first item's icon to add it to favorites.
      await tester.tap(find.byIcon(Icons.school).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));

    const loadingDuration = Duration(milliseconds: 500);

    // At first, the catalog shows only "..." (loading items).
    expect(find.text('...'), findsWidgets);
    expect(find.text('Color #1'), findsNothing);

    await tester.pump(loadingDuration);

    // After the app has had a chance to load items, it should no longer
    // show "...".
    expect(find.text('...'), findsNothing);
    expect(find.text('Color #1'), findsOneWidget);

    // Flinging up quickly (i.e. scrolling down).
    await tester.fling(find.byType(ListView), const Offset(0, -2000), 5000);

    // As we scroll down, we should see more items loading.
    expect(find.text('...'), findsWidgets);
    // The item at the top should no longer be in view.
    expect(find.text('Color #1'), findsNothing);

    // This last part is just giving the app time to complete its "fetch"
    // of new items. Otherwise, the test fails because of outstanding
    // asynchronous callbacks.
    await tester.pump(loadingDuration);
  });

}


Future<void> _startapp(WidgetTester tester, String email, String password) async {
  await tester.pumpWidget(MaterialApp(
    home: MyStatefulWidget(
    ),
  ));
}