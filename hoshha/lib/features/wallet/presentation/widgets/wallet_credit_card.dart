import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../pages/wallet_management_page.dart';

class WalletCreditCard extends StatelessWidget {
  final WalletAccountData account;

  const WalletCreditCard({
    super.key,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260.0,
      margin: const EdgeInsets.only(left: 16.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: account.gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppTheme.radiusCard),
        boxShadow: [
          BoxShadow(
            color: account.gradientColors[0].withValues(alpha: 0.3),
            blurRadius: 15.0,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                account.accountType,
                style: const TextStyle(color: Colors.white70, fontSize: 10.0),
              ),
              const Icon(Icons.credit_card, color: Colors.white70),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'الرصيد المتوفر',
                style: TextStyle(color: Colors.white70, fontSize: 10.0),
              ),
              const SizedBox(height: 4.0),
              Text(
                '${account.balance.toStringAsFixed(0)} ريال',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            account.accountName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13.0,
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
