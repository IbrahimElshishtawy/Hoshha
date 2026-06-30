import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/wallet_account.dart';
import 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());

  void loadWalletData() {
    emit(WalletLoading());

    // Mock loading data
    Future.delayed(const Duration(milliseconds: 300), () {
      emit(WalletLoaded(
        accounts: const [
          WalletAccount(
            accountName: 'حساب الرواتب الراجحي',
            accountType: 'حساب جاري',
            balance: 32400.0,
            gradientColors: [AppTheme.primary, AppTheme.secondary],
          ),
          WalletAccount(
            accountName: 'بطاقة الفرسان الائتمانية',
            accountType: 'بطاقة ائتمان',
            balance: 12500.0,
            gradientColors: [AppTheme.tertiary, Colors.blueGrey],
          ),
          WalletAccount(
            accountName: 'المحفظة النقدية الكاش',
            accountType: 'كاش يدوي',
            balance: 330.0,
            gradientColors: [AppTheme.secondary, Colors.teal],
          ),
        ],
        netWorth: 45230.0,
        assets: 49080.0,
        liabilities: 3850.0,
      ));
    });
  }
}
