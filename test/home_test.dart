import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_app/src/http/mock_client.dart';
import 'package:form_app/main.dart';

void main() {
  testWidgets('sign in', (tester) async {
    await _startapp(tester, 'root', 'password');
    // Check if any solid favorite icon shows up.
      expect(find.byIcon(Icons.home), findsWidgets);

      // Tap the first item's icon to add it to favorites.
      await tester.tap(find.byIcon(Icons.home).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify if the appropriate message is shown.
      expect(find.text('Infinite List'), findsOneWidget);
  });

}


Future<void> _startapp(WidgetTester tester, String email, String password) async {
  await tester.pumpWidget(MaterialApp(
    home: MyStatefulWidget(
    ),
  ));
}