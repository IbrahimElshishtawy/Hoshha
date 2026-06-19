class HomeTransaction {
  const HomeTransaction({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.date,
    required this.amount,
    required this.category,
    required this.isIncome,
  });

  final String id;
  final String titleEn;
  final String titleAr;
  final DateTime date;
  final double amount;
  final String category; // 'food', 'salary', 'utilities', 'transport'
  final bool isIncome;

  HomeTransaction copyWith({
    String? id,
    String? titleEn,
    String? titleAr,
    DateTime? date,
    double? amount,
    String? category,
    bool? isIncome,
  }) {
    return HomeTransaction(
      id: id ?? this.id,
      titleEn: titleEn ?? this.titleEn,
      titleAr: titleAr ?? this.titleAr,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      isIncome: isIncome ?? this.isIncome,
    );
  }
}
