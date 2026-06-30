import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/category_spend.dart';
import 'analytics_state.dart';

class AnalyticsCubit extends Cubit<AnalyticsState> {
  AnalyticsCubit() : super(AnalyticsInitial());

  void loadAnalytics() {
    emit(AnalyticsLoading());

    // Mock load
    Future.delayed(const Duration(milliseconds: 300), () {
      emit(const AnalyticsLoaded(
        categories: [
          CategorySpend(
            name: 'الطعام والمطاعم',
            spent: 1200.0,
            limit: 1500.0,
            color: AppTheme.primary,
            icon: Icons.restaurant,
          ),
          CategorySpend(
            name: 'التسوق والملابس',
            spent: 950.0,
            limit: 1200.0,
            color: AppTheme.secondary,
            icon: Icons.shopping_bag,
          ),
          CategorySpend(
            name: 'المواصلات والوقود',
            spent: 500.0,
            limit: 600.0,
            color: AppTheme.tertiary,
            icon: Icons.directions_car,
          ),
          CategorySpend(
            name: 'الترفيه والألعاب',
            spent: 350.0,
            limit: 300.0, // Exceeded!
            color: AppTheme.error,
            icon: Icons.sports_esports,
          ),
        ],
      ));
    });
  }
}
