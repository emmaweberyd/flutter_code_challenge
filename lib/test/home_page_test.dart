import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_code_challenge/home_page.dart';
import 'package:flutter_code_challenge/main.dart';
import 'package:flutter_code_challenge/styled_button.dart';

void main() {
  testWidgets('Widget renders', (tester) async {
    await tester.pumpWidget(const MainApp());

    expect(find.byType(HomePage), findsOneWidget);
  });

  testWidgets(
      ' GIVEN empty text field '
      ' WHEN user taps button '
      ' THEN will not throw exception ', (tester) async {
    await tester.pumpWidget(const MainApp());

    await tester.enterText(find.byType(TextField), '');

    await tester.tap(find.byType(StyledButton));

    await tester.pumpAndSettle(const Duration(seconds: 2));
  });
}
