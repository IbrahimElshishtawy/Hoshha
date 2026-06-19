import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:hoshha/l10n/generated/app_localizations.dart';
import 'package:hoshha/theme/theme_extensions.dart';
import '../controllers/journey_controller.dart';
import '../../domain/entities/journey_milestone.dart';
import '../../home/presentation/widgets/bottom_nav_bar.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(journeyControllerProvider);
    final colors = context.appColors;
    final spacing = context.appSpacing;
    final radius = context.appRadius;

    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAF8),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.01),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: spacing.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Bell Icon (Notification)
                  IconButton(
                    icon: Icon(
                      Icons.notifications_none_outlined,
                      color: colors.onSurface.withValues(alpha: 0.7),
                      size: 26,
                    ),
                    onPressed: () {},
                  ),
                  // App Title & Avatar Group
                  Row(
                    children: [
                      const Text(
                        'Hawsha',
                        style: TextStyle(
                          color: Color(0xFF0B5A52),
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: colors.outline.withValues(alpha: 0.2),
                            width: 1.5,
                          ),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1560250097-0b93528c311a?w=100&h=100&fit=crop',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: stateAsync.when(
        data: (state) {
          final data = state.journeyData;
          final milestones = state.milestones;

          final numberFormat = NumberFormat('#,##0.##', Localizations.localeOf(context).languageCode);

          return RefreshIndicator(
            onRefresh: () => ref.read(journeyControllerProvider.notifier).refresh(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Page Header
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context).journeyTitle,
                    style: TextStyle(
                      color: colors.primary,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppLocalizations.of(context).journeySubtitle,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 1. Total Savings Card (White card, pig icon)
                  _buildTotalSavingsCard(context, data, numberFormat),
                  const SizedBox(height: 16),

                  // 2. Sub Cards (Income and Expenses side-by-side)
                  Row(
                    children: [
                      Expanded(
                        child: _buildSubCard(
                          context: context,
                          label: AppLocalizations.of(context).journeyTotalIncome,
                          amount: data.totalIncome,
                          icon: Icons.arrow_upward,
                          iconColor: colors.success,
                          bgColor: colors.success.withValues(alpha: 0.08),
                          numberFormat: numberFormat,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildSubCard(
                          context: context,
                          label: AppLocalizations.of(context).journeyTotalExpenses,
                          amount: data.totalExpenses,
                          icon: Icons.arrow_downward,
                          iconColor: colors.error,
                          bgColor: colors.error.withValues(alpha: 0.08),
                          numberFormat: numberFormat,
                          isNegative: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // 3. Goals Achieved Card (Yellow card)
                  _buildGoalsAchievedCard(context, data),
                  const SizedBox(height: 24),

                  // 4. Milestones Section
                  _buildMilestonesSection(context, data, numberFormat, isRtl),
                  const SizedBox(height: 24),

                  // 5. Growth Tree Card
                  _buildGrowthTreeCard(context, data, isRtl),
                  const SizedBox(height: 24),

                  // 6. Timeline Section
                  _buildTimelineSection(context, milestones, isRtl),
                  const SizedBox(height: 24),

                  // 7. Call to Action Card
                  _buildCallToActionCard(context, isRtl),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isRtl ? 'حدث خطأ ما أثناء تحميل الرحلة' : 'An error occurred while loading your journey',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => ref.read(journeyControllerProvider.notifier).refresh(),
                child: Text(isRtl ? 'إعادة المحاولة' : 'Retry'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentRoute: '/history',
        onAddPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                isRtl ? 'يرجى الانتقال للرئيسية لإضافة معاملة!' : 'Please navigate to Home to add a transaction!',
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTotalSavingsCard(BuildContext context, dynamic data, NumberFormat numberFormat) {
    final colors = context.appColors;
    final spacing = context.appSpacing;
    final radius = context.appRadius;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: colors.outline.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).journeyTotalSavings,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      numberFormat.format(data.totalSavings),
                      style: TextStyle(
                        color: colors.primary,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      AppLocalizations.of(context).homeCurrencyAbbr,
                      style: TextStyle(
                        color: colors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  AppLocalizations.of(context).journeySavingsMotivation,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.piggy_bank_outlined,
              color: colors.primary,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubCard({
    required BuildContext context,
    required String label,
    required double amount,
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required NumberFormat numberFormat,
    bool isNegative = false,
  }) {
    final colors = context.appColors;
    final spacing = context.appSpacing;
    final radius = context.appRadius;

    return Container(
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius.md),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.015),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: colors.outline.withValues(alpha: 0.08),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: bgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '${isNegative ? '-' : ''}${numberFormat.format(amount)}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                AppLocalizations.of(context).homeCurrencyAbbr,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGoalsAchievedCard(BuildContext context, dynamic data) {
    final radius = context.appRadius;
    final spacing = context.appSpacing;

    const goldColor = Color(0xFF8B6F15);
    final lightGoldBg = goldColor.withValues(alpha: 0.08);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF8F3), // light warm cream/orange color
        borderRadius: BorderRadius.circular(radius.md),
        border: Border.all(
          color: goldColor.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).journeyGoalsAchieved(data.goalsAchievedCount),
                  style: const TextStyle(
                    color: goldColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  AppLocalizations.of(context).journeyGoalsMotivation(data.goalsAchievedPercent.toInt()),
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.emoji_events_outlined,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMilestonesSection(
    BuildContext context,
    dynamic data,
    NumberFormat numberFormat,
    bool isRtl,
  ) {
    final colors = context.appColors;
    final spacing = context.appSpacing;
    final radius = context.appRadius;

    final bestMonthText = isRtl ? data.bestSavingsMonthNameAr : data.bestSavingsMonthNameEn;
    final lowestMonthText = isRtl ? data.lowestSavingsMonthNameAr : data.lowestSavingsMonthNameEn;
    final lowestReason = isRtl ? data.lowestSavingsMonthReasonAr : data.lowestSavingsMonthReasonEn;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context).journeyMilestones,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        // Best Savings Month (Dark Teal)
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(spacing.lg),
          decoration: BoxDecoration(
            color: const Color(0xFF074D46), // Deep green/teal
            borderRadius: BorderRadius.circular(radius.lg),
            boxShadow: [
              BoxShadow(
                color: colors.primary.withValues(alpha: 0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.trending_up,
                        color: Color(0xFF6AD8AE),
                        size: 20,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        AppLocalizations.of(context).journeyBestSavingsMonth,
                        style: const TextStyle(
                          color: Color(0xFF6AD8AE),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                bestMonthText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                AppLocalizations.of(context).journeySavedPercent(
                  '${numberFormat.format(data.bestSavingsMonthAmount)} ${AppLocalizations.of(context).homeCurrencyAbbr}',
                  data.bestSavingsMonthPercent.toInt(),
                ),
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Lowest Savings Month (Light grey)
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(spacing.lg),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(radius.lg),
            border: Border.all(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.trending_down,
                        color: Colors.red.shade700,
                        size: 20,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        AppLocalizations.of(context).journeyLowestSavingsMonth,
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                lowestMonthText,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                AppLocalizations.of(context).journeySpentPercent(
                  data.lowestSavingsMonthSpendingPercent.toInt(),
                  lowestReason,
                ),
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGrowthTreeCard(BuildContext context, dynamic data, bool isRtl) {
    final colors = context.appColors;
    final spacing = context.appSpacing;
    final radius = context.appRadius;

    final rank = isRtl ? data.treeGrowthRankAr : data.treeGrowthRankEn;
    final text = isRtl ? data.treeGrowthTextAr : data.treeGrowthTextEn;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.015),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: colors.outline.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFD4EAE6), // soft teal
              borderRadius: BorderRadius.circular(radius.sm),
            ),
            child: Text(
              rank,
              style: TextStyle(
                color: colors.primary,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            AppLocalizations.of(context).journeyGrowthTree,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineSection(BuildContext context, List<JourneyMilestone> milestones, bool isRtl) {
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context).journeyTimeline,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: milestones.length,
          itemBuilder: (context, index) {
            final milestone = milestones[index];
            final isLast = index == milestones.length - 1;

            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Icon + Vertical Line Column
                  Column(
                    children: [
                      // Node Icon
                      _buildTimelineIcon(milestone.iconType, colors),
                      // Line
                      if (!isLast)
                        Expanded(
                          child: Container(
                            width: 2,
                            color: Colors.grey.shade300,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  // Content Column
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isRtl ? milestone.dateAr : milestone.dateEn,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            isRtl ? milestone.titleAr : milestone.titleEn,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            isRtl ? milestone.descriptionAr : milestone.descriptionEn,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.4,
                            ),
                          ),
                          // Optional Image (e.g. laptop mockup)
                          if (milestone.imageUrl != null) ...[
                            const SizedBox(height: 12),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                width: double.infinity,
                                height: 180,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade200,
                                    width: 1,
                                  ),
                                ),
                                child: Image.network(
                                  milestone.imageUrl!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTimelineIcon(String iconType, AppColorThemeExtension colors) {
    IconData icon;
    Color bgColor;
    Color iconColor;

    switch (iconType) {
      case 'star':
        icon = Icons.star;
        bgColor = const Color(0xFFD4EAE6); // Teal
        iconColor = colors.primary;
        break;
      case 'laptop':
        icon = Icons.laptop;
        bgColor = const Color(0xFFFCF3EA); // Orange/cream
        iconColor = Colors.orange;
        break;
      case 'teal_card':
        icon = Icons.account_balance_wallet_outlined;
        bgColor = const Color(0xFFD4EAE6);
        iconColor = colors.primary;
        break;
      case 'clock':
        icon = Icons.calendar_today_outlined;
        bgColor = Colors.grey.shade200;
        iconColor = Colors.grey.shade600;
        break;
      default:
        icon = Icons.circle;
        bgColor = Colors.grey.shade200;
        iconColor = Colors.grey;
    }

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 16,
      ),
    );
  }

  Widget _buildCallToActionCard(BuildContext context, bool isRtl) {
    final colors = context.appColors;
    final spacing = context.appSpacing;
    final radius = context.appRadius;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.lg),
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: BorderRadius.circular(radius.lg),
      ),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context).journeyWhatNext,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context).journeyWhatNextText,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isRtl ? 'سيتم ربط تحديد هدف جديد قريباً!' : 'New goal definition will be connected soon!',
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFB41D), // bright gold yellow
              foregroundColor: colors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius.pill),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              elevation: 0,
            ),
            child: Text(
              AppLocalizations.of(context).journeyDefineNewGoal,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
