import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/debt_item.dart';
import 'debt_state.dart';

class DebtCubit extends Cubit<DebtState> {
  DebtCubit() : super(DebtInitial());

  void loadDebts() {
    emit(DebtLoading());

    // Mock load
    Future.delayed(const Duration(milliseconds: 300), () {
      emit(const DebtLoaded(
        debtsOwedToOthers: [
          DebtItem(
            personName: 'أبو محمد (مكتب العقار)',
            amount: 3000.0,
            dueDate: '1 نوفمبر 2026',
            description: 'دفعة الإيجار المتأخرة',
          ),
          DebtItem(
            personName: 'خالد العتيبي',
            amount: 850.0,
            dueDate: '15 نوفمبر 2026',
            description: 'قيمة قطية الاستراحة',
          ),
        ],
        debtsOwedToMe: [
          DebtItem(
            personName: 'سعد القحطاني',
            amount: 1200.0,
            dueDate: '25 أكتوبر 2026',
            description: 'سلفة لتصليح سيارته',
          ),
          DebtItem(
            personName: 'فهد الأحمد',
            amount: 450.0,
            dueDate: '10 ديسمبر 2026',
            description: 'قيمة هدية زواج أحمد',
          ),
        ],
      ));
    });
  }
}
