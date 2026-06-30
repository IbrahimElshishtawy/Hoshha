import 'package:flutter_bloc/flutter_bloc.dart';
import 'financial_reports_state.dart';
import '../../domain/entities/financial_report.dart';

class FinancialReportsCubit extends Cubit<FinancialReportsState> {
  FinancialReportsCubit() : super(FinancialReportsInitial());

  void loadReport(DateTime month) {
    emit(FinancialReportsLoading());
    // Simulate loading report
    emit(FinancialReportsLoaded(
      FinancialReport(
        month: month,
        totalIncome: 12700,
        totalExpense: 8500,
        netSavings: 4200,
        topCategories: const [
          CategorySpending(categoryName: 'التسوق والترفيه', amount: 3825, percentage: 45, iconDataString: 'shopping_bag', colorHex: '#004ac6'),
          CategorySpending(categoryName: 'المطاعم والكافيهات', amount: 2550, percentage: 30, iconDataString: 'restaurant', colorHex: '#006c49'),
          CategorySpending(categoryName: 'فواتير وخدمات', amount: 2125, percentage: 25, iconDataString: 'home_repair_service', colorHex: '#ab0b1c'),
        ],
        dailyTrend: List.generate(30, (index) => (index * 10 % 100).toDouble()),
      )
    ));
  }
}
