import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/dashboard/presentation/dashboard_screen.dart';
import '../infrastructure/providers.dart';

class HoshhaApp extends ConsumerWidget {
  const HoshhaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final environment = ref.watch(appEnvironmentProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: environment.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B6E4F)),
        scaffoldBackgroundColor: const Color(0xFFF7F6F2),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}
