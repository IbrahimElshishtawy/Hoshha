import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/bill.dart';
import 'bills_state.dart';

class BillsCubit extends Cubit<BillsState> {
  BillsCubit() : super(BillsInitial());

  void loadBills() {
    emit(BillsLoading());

    // Mock load
    Future.delayed(const Duration(milliseconds: 300), () {
      emit(const BillsLoaded(
        bills: [
          Bill(
            title: 'فاتورة الكهرباء (الشركة السعودية)',
            amount: 350.0,
            dueDate: 'في خلال يومين',
            isOverdue: false,
            icon: Icons.electric_bolt,
          ),
          Bill(
            title: 'اشتراك الإنترنت المنزلي (STC)',
            amount: 230.0,
            dueDate: 'متأخرة منذ 3 أيام',
            isOverdue: true,
            icon: Icons.wifi,
          ),
          Bill(
            title: 'اشتراك نتفليكس (Netflix)',
            amount: 45.0,
            dueDate: '10 نوفمبر 2026',
            isOverdue: false,
            icon: Icons.movie_filter,
          ),
        ],
      ));
    });
  }
}
