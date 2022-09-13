import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_app/src/http/mock_client.dart';
import 'package:form_app/main.dart';

void main() {
  testWidgets('sign in', (tester) async {
    await _startapp(tester, 'root', 'password');
    // Check if any solid favorite icon shows up.
      expect(find.byIcon(Icons.home), findsWidgets);
  });

}


Future<void> _startapp(WidgetTester tester, String email, String password) async {
  await tester.pumpWidget(MaterialApp(
    home: MyStatefulWidget(
    ),
  ));
}