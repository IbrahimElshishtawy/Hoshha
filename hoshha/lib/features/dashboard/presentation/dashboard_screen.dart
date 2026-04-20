import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoshha/l10n/generated/app_localizations.dart';

import '../../../app/app_providers.dart';
import '../../../core/config/app_environment.dart';
import '../../../core/config/app_feature_flags.dart';
import '../../../theme/theme_extensions.dart';
import '../dashboard_providers.dart';
import '../domain/dashboard_snapshot.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapshot = ref.watch(dashboardControllerProvider);
    final environment = ref.watch(appEnvironmentProvider);
    final flags = ref.watch(appFeatureFlagsProvider);
    final spacing = context.appSpacing;

    return Scaffold(
      appBar: AppBar(title: Text(environment.appName)),
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(dashboardControllerProvider.notifier).refresh(),
        child: ListView(
          padding: EdgeInsets.all(spacing.lg),
          children: [
            _EnvironmentBanner(environment: environment, flags: flags),
            SizedBox(height: spacing.md),
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
    final l10n = AppLocalizations.of(context);
    final spacing = context.appSpacing;
    final statusEnabled = l10n.statusEnabled;
    final statusDisabled = l10n.statusDisabled;
    final chips = <String>[
      l10n.environmentChip(environment.environment.name),
      l10n.authChip(flags.authEnabled ? statusEnabled : statusDisabled),
      l10n.premiumChip(flags.premiumEnabled ? statusEnabled : statusDisabled),
      l10n.updatesChip(
        flags.inAppUpdatesEnabled ? statusEnabled : statusDisabled,
      ),
      l10n.syncChip(flags.remoteSyncEnabled ? statusEnabled : statusDisabled),
    ];

    return Card(
      child: Padding(
        padding: EdgeInsets.all(spacing.md),
        child: Wrap(
          spacing: spacing.sm,
          runSpacing: spacing.sm,
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
    final l10n = AppLocalizations.of(context);
    final spacing = context.appSpacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _MetricCard(
          title: l10n.dashboardMonthlySpendTitle,
          value: snapshot.totalSpent.toStringAsFixed(0),
          subtitle: l10n.dashboardMonthlySpendSubtitle(
            snapshot.transactionCount,
          ),
        ),
        SizedBox(height: spacing.sm + spacing.xs),
        _MetricCard(
          title: l10n.dashboardBudgetRemainingTitle,
          value: snapshot.remainingBudget.toStringAsFixed(0),
          subtitle: l10n.dashboardBudgetRemainingSubtitle(
            snapshot.budgetLimit.toStringAsFixed(0),
          ),
        ),
        SizedBox(height: spacing.sm + spacing.xs),
        _MetricCard(
          title: l10n.dashboardGamificationTitle,
          value: 'Level ${snapshot.level}',
          subtitle: l10n.dashboardGamificationSubtitle(
            snapshot.streakDays,
            snapshot.xp,
          ),
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
    final spacing = context.appSpacing;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(spacing.md + spacing.xs),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: spacing.sm),
            Text(value, style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: spacing.xs),
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
    final l10n = AppLocalizations.of(context);
    final spacing = context.appSpacing;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(spacing.md + spacing.xs),
        child: Text(l10n.dashboardLoadFailure(error.toString())),
      ),
    );
  }
}
