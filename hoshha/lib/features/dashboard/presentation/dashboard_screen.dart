import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/config/app_environment.dart';
import '../../../core/config/app_feature_flags.dart';
import '../../../infrastructure/providers.dart';
import '../dashboard_providers.dart';
import '../domain/dashboard_snapshot.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapshot = ref.watch(dashboardControllerProvider);
    final environment = ref.watch(appEnvironmentProvider);
    final flags = ref.watch(appFeatureFlagsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(environment.appName)),
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(dashboardControllerProvider.notifier).refresh(),
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            _EnvironmentBanner(environment: environment, flags: flags),
            const SizedBox(height: 16),
            snapshot.when(
              data: (value) => _DashboardContent(snapshot: value),
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, _) => _ErrorState(error: error),
            ),
          ],
        ),
      ),
    );
  }
}

class _EnvironmentBanner extends StatelessWidget {
  const _EnvironmentBanner({required this.environment, required this.flags});

  final AppEnvironment environment;
  final AppFeatureFlags flags;

  @override
  Widget build(BuildContext context) {
    final chips = <String>[
      'env: ${environment.environment.name}',
      'auth: ${flags.authEnabled ? 'on' : 'off'}',
      'premium: ${flags.premiumEnabled ? 'on' : 'off'}',
      'updates: ${flags.inAppUpdatesEnabled ? 'on' : 'off'}',
      'sync: ${flags.remoteSyncEnabled ? 'on' : 'off'}',
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: chips.map((chip) => Chip(label: Text(chip))).toList(),
        ),
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent({required this.snapshot});

  final DashboardSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _MetricCard(
          title: 'Monthly spend',
          value: snapshot.totalSpent.toStringAsFixed(0),
          subtitle: '${snapshot.transactionCount} tracked expenses',
        ),
        const SizedBox(height: 12),
        _MetricCard(
          title: 'Budget remaining',
          value: snapshot.remainingBudget.toStringAsFixed(0),
          subtitle: 'Budget cap ${snapshot.budgetLimit.toStringAsFixed(0)}',
        ),
        const SizedBox(height: 12),
        _MetricCard(
          title: 'Gamification',
          value: 'Level ${snapshot.level}',
          subtitle: '${snapshot.streakDays} day streak | ${snapshot.xp} XP',
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.title,
    required this.value,
    required this.subtitle,
  });

  final String title;
  final String value;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(value, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 4),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text('Failed to load dashboard snapshot: $error'),
      ),
    );
  }
}
