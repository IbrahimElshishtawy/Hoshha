import '../models/budget_status.dart';
import '../models/budget_status_thresholds.dart';
import '../models/monthly_summary.dart';

class BudgetStatusCalculator {
  const BudgetStatusCalculator({this.thresholds = BudgetStatusThresholds.v1});

  final BudgetStatusThresholds thresholds;

  BudgetStatus call(MonthlySummary summary) {
    return fromAmounts(
      spentMinor: summary.spentMinor,
      budgetMinor: summary.budgetMinor,
    );
  }

  BudgetStatus fromAmounts({
    required int spentMinor,
    required int budgetMinor,
  }) {
    if (budgetMinor <= 0) {
      return BudgetStatus.safe;
    }

    final usageRatio = spentMinor / budgetMinor;
    if (usageRatio >= thresholds.exceededPercentage) {
      return BudgetStatus.exceeded;
    }
    if (usageRatio >= thresholds.warningPercentage) {
      return BudgetStatus.warning;
    }
    return BudgetStatus.safe;
  }
}
