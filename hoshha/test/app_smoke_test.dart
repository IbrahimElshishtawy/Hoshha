import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoshha/app/hoshha_app.dart';

void main() {
  testWidgets('renders architecture bootstrap shell', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: HoshhaApp()));
    await tester.pumpAndSettle();

    expect(find.text('حوشها'), findsOneWidget);
    expect(find.text('Monthly spend'), findsOneWidget);
    expect(find.text('Gamification'), findsOneWidget);
  });
}
