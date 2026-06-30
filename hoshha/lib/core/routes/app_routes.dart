import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/home/presentation/pages/home_dashboard_page.dart';
import '../../features/transaction/presentation/pages/add_transaction_page.dart';
import '../../features/ai_assistant/presentation/pages/ai_assistant_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/profile/presentation/pages/settings_page.dart';
import '../../features/budget/presentation/pages/budget_management_page.dart';
import '../../features/debt/presentation/pages/debt_tracker_page.dart';
import '../../features/bills/presentation/pages/bills_reminder_page.dart';
import '../../features/notifications/presentation/pages/notifications_page.dart';
import '../../features/analytics/presentation/pages/spending_calendar_page.dart';

class AppRoutes {
  AppRoutes._();

  static const String login = '/';
  static const String register = '/register';
  static const String home = '/home';
  static const String addTransaction = '/add_transaction';
  static const String aiAssistant = '/ai_assistant';
  static const String onboarding = '/onboarding';
  static const String settings = '/settings';
  static const String budget = '/budget';
  static const String debt = '/debt';
  static const String bills = '/bills';
  static const String notifications = '/notifications';
  static const String calendar = '/calendar';

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeDashboardPage());
      case addTransaction:
        return MaterialPageRoute(builder: (_) => const AddTransactionPage());
      case aiAssistant:
        return MaterialPageRoute(builder: (_) => const AiAssistantPage());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case settings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case budget:
        return MaterialPageRoute(builder: (_) => const BudgetManagementPage());
      case debt:
        return MaterialPageRoute(builder: (_) => const DebtTrackerPage());
      case bills:
        return MaterialPageRoute(builder: (_) => const BillsReminderPage());
      case notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsPage());
      case calendar:
        return MaterialPageRoute(builder: (_) => const SpendingCalendarPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('الصفحة غير موجودة: ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
