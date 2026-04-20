import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoshha/app/hoshha_app.dart';
import 'package:hoshha/infrastructure/storage/storage_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('renders localized dashboard inside app shell', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final sharedPreferences = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        ],
        child: const HoshhaApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('حوشها'), findsOneWidget);
    expect(find.text('المصروف الشهري'), findsOneWidget);
    expect(find.text('التحدي'), findsOneWidget);
  });
}
