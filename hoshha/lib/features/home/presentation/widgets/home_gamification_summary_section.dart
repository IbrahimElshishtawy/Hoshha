import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:hoshha/l10n/generated/app_localizations.dart';

import '../../../gamification/gamification_providers.dart';
import 'gamification_summary_card.dart';
import 'home_section_error.dart';
import 'home_section_skeleton.dart';

class HomeGamificationSummarySection extends ConsumerWidget {
  const HomeGamificationSummarySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final snapshotAsync = ref.watch(gamificationSnapshotProvider);

    return snapshotAsync.when(
      loading: () => const HomeSectionSkeleton.card(),
      error: (error, _) => HomeSectionError(
        title: l10n.homeGamificationSectionTitle,
        message: l10n.homeSectionLoadFailure(l10n.homeGamificationSectionTitle),
        retryLabel: l10n.homeRetry,
        onRetry: () => ref.invalidate(gamificationSnapshotProvider),
      ),
      data: (snapshot) {
        final locale = Localizations.localeOf(context).toLanguageTag();
        final progress = snapshot.nextLevelProgress.clamp(0.0, 1.0);
        final xpValue = NumberFormat.decimalPattern(
          locale,
        ).format(snapshot.totalXp);

        return GamificationSummaryCard(
          title: l10n.homeGamificationSectionTitle,
          xpValue: xpValue,
          xpLabel: l10n.homeGamificationXpLabel,
          levelLabel: l10n.homeGamificationLevelLabel(snapshot.currentLevel),
          streakLabel: l10n.homeGamificationStreakLabel(snapshot.currentStreak),
          progress: progress,
          progressLabel: l10n.homeGamificationNextLevelLabel(
            (progress * 100).round(),
          ),
          message: snapshot.totalXp == 0
              ? l10n.homeGamificationEmptyMessage
              : l10n.homeGamificationActiveMessage,
        );
      },
    );
  }
}
