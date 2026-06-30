import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/budget_limit.dart';
import 'budget_state.dart';

class BudgetCubit extends Cubit<BudgetState> {
  BudgetCubit() : super(BudgetInitial());

  void loadBudgets() {
    emit(BudgetLoading());

    // Mock load
    Future.delayed(const Duration(milliseconds: 300), () {
      emit(const BudgetLoaded(
        budgets: [
          BudgetLimit(
            categoryName: 'المطاعم والمقاهي',
            spent: 1200.0,
            limit: 1500.0,
            icon: Icons.restaurant,
          ),
          BudgetLimit(
            categoryName: 'السوبرماركت والمقاضي',
            spent: 1850.0,
            limit: 2000.0,
            icon: Icons.shopping_basket,
          ),
          BudgetLimit(
            categoryName: 'التسوق والتجزئة',
            spent: 980.0,
            limit: 1000.0,
            icon: Icons.shopping_bag,
          ),
          BudgetLimit(
            categoryName: 'الترفيه والأنشطة',
            spent: 420.0,
            limit: 300.0, // Exceeded!
            icon: Icons.sports_esports,
          ),
        ],
      ));
    });
  }
}
