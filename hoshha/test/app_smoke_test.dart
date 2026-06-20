import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoshha/app/app_providers.dart';
import 'package:hoshha/app/hoshha_app.dart';
import 'package:hoshha/core/time/clock.dart';
import 'package:hoshha/features/home/presentation/controllers/home_controller.dart';
import 'package:hoshha/features/home/domain/entities/home_dashboard_data.dart';
import 'package:hoshha/features/home/domain/entities/home_transaction.dart';
import 'package:hoshha/features/home/presentation/widgets/balance_card.dart';
import 'package:hoshha/features/home/presentation/widgets/smart_tip_card.dart';
import 'package:hoshha/infrastructure/storage/storage_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('renders localized dashboard inside app shell', (tester) async {
    // Set HTTP overrides inside the test execution context
    HttpOverrides.global = TestHttpOverrides();
    
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
    expect(find.text('Hawsha'), findsOneWidget);
    expect(find.byType(BalanceCard), findsOneWidget);
    expect(find.byType(SmartTipCard), findsOneWidget);
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

class TestHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return _MockHttpClient();
  }
}

class _MockHttpClient implements HttpClient {
  @override
  Future<HttpClientRequest> getUrl(Uri url) async => _MockHttpClientRequest();

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _MockHttpClientRequest implements HttpClientRequest {
  @override
  Future<HttpClientResponse> close() async => _MockHttpClientResponse();

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _MockHttpClientResponse implements HttpClientResponse {
  @override
  int get statusCode => 200;

  @override
  int get contentLength => _transparentPng.length;

  @override
  HttpClientResponseCompressionState get compressionState =>
      HttpClientResponseCompressionState.notCompressed;

  @override
  StreamSubscription<List<int>> listen(
    void Function(List<int> event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return Stream<List<int>>.fromIterable([_transparentPng]).listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

final List<int> _transparentPng = [
  137, 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 13, 73, 72, 68, 82, 0, 0, 0, 1, 0, 0, 0, 1, 8, 6, 0, 0, 0, 31, 21, 196, 137, 0, 0, 0, 11, 73, 68, 65, 84, 8, 215, 99, 96, 0, 0, 0, 2, 0, 1, 226, 33, 188, 51, 0, 0, 0, 0, 73, 69, 78, 68, 174, 66, 96, 130
];
