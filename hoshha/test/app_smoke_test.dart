import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoshha/app/app_providers.dart';
import 'package:hoshha/app/hoshha_app.dart';
import 'package:hoshha/core/time/clock.dart';
import 'package:hoshha/features/home/presentation/controllers/home_controller.dart';
import 'package:hoshha/features/home/domain/entities/home_dashboard_data.dart';
import 'package:hoshha/features/home/domain/entities/home_transaction.dart';
import 'package:hoshha/infrastructure/storage/storage_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('renders localized dashboard inside app shell', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final sharedPreferences = await SharedPreferences.getInstance();
    final clock = _TestClock(DateTime(2026, 4, 20, 12));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          clockProvider.overrideWithValue(clock),
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
          homeControllerProvider.overrideWith(() => HomeControllerMock()),
        ],
        child: const HoshhaApp(),
      ),
    );
    await tester.pump(); // Start build
    await tester.pump(); // Finish futures / trigger layout

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });
}

class _TestClock implements Clock {
  const _TestClock(this._now);

  final DateTime _now;

  @override
  DateTime now() => _now;
}

class HomeControllerMock extends HomeController {
  @override
  Future<HomeState> build() async {
    return HomeState(
      dashboardData: const HomeDashboardData(
        currentBalance: 15420.0,
        todayExpenses: 450.0,
        monthExpenses: 6200.0,
        budgetPercentage: 92.0,
        smartTipEn: 'Your spending on restaurants increased by 15% this week. We recommend saving an extra 200 EGP to reach your monthly goal.',
        smartTipAr: 'زاد إنفاقك على المطاعم بنسبة ١٥٪ هذا الأسبوع. ننصحك بتوفير ٢٠٠ جنيه إضافية لتصل لهدفك الشهري.',
      ),
      transactions: [
        HomeTransaction(
          id: '1',
          titleEn: "McDonald's",
          titleAr: 'ماكدونالدز',
          date: DateTime.now(),
          amount: 150.0,
          category: 'food',
          isIncome: false,
        ),
      ],
    );
  }
}
