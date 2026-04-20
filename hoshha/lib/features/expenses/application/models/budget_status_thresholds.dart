class BudgetStatusThresholds {
  const BudgetStatusThresholds({
    this.warningPercentage = 0.8,
    this.exceededPercentage = 1.0,
  }) : assert(warningPercentage >= 0),
       assert(exceededPercentage >= warningPercentage);

  static const v1 = BudgetStatusThresholds();

  final double warningPercentage;
  final double exceededPercentage;
}
