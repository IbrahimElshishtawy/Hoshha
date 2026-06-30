import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/home/presentation/pages/home_dashboard_page.dart';
import '../../features/transaction/presentation/pages/add_transaction_page.dart';
import '../../features/ai_assistant/presentation/pages/ai_assistant_page.dart';

class AppRoutes {
  AppRoutes._();

  static const String login = '/';
  static const String register = '/register';
  static const String home = '/home';
  static const String addTransaction = '/add_transaction';
  static const String aiAssistant = '/ai_assistant';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
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
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('الصفحة غير موجودة: ${settings.name}'),
            ),
          ),
        );
    }
  }
}
