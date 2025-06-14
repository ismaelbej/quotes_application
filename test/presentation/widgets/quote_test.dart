import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quotes_application/presentation/widgets/quote.dart';

void main() {
  Widget createWidget(Widget widget) =>
      MaterialApp(home: Scaffold(body: Row(children: [widget])));

  testWidgets('Display Quote widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      createWidget(Quote(text: "test0", author: "test1", color: Colors.black)),
    );

    expect(find.text('test0'), findsOneWidget);
    expect(find.text('test1'), findsOneWidget);
  });
}
