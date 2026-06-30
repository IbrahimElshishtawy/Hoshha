import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/net_worth_card.dart';
import '../widgets/wallet_credit_card.dart';

class WalletManagementPage extends StatelessWidget {
  const WalletManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Mock accounts list
    final accounts = [
      const WalletAccountData(
        accountName: 'حساب الرواتب الراجحي',
        accountType: 'حساب جاري',
        balance: 32400.0,
        gradientColors: [AppTheme.primary, AppTheme.secondary],
      ),
      const WalletAccountData(
        accountName: 'بطاقة الفرسان الائتمانية',
        accountType: 'بطاقة ائتمان',
        balance: 12500.0,
        gradientColors: [AppTheme.tertiary, Colors.blueGrey],
      ),
      const WalletAccountData(
        accountName: 'المحفظة النقدية الكاش',
        accountType: 'كاش يدوي',
        balance: 330.0,
        gradientColors: [AppTheme.secondary, Colors.teal],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'إدارة المحفظة والحسابات',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: AppTheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withValues(alpha: 0.7),
        elevation: 2.0,
        shadowColor: Colors.black12,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Net worth header card
            const Padding(
              padding: EdgeInsets.all(AppTheme.containerMargin),
              child: NetWorthCard(),
            ),
            const SizedBox(height: 16.0),

            // Horizontal Accounts list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.containerMargin),
              child: Text(
                'حساباتك المصرفية والبطاقات',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: AppTheme.onSurface,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(height: 16.0),

            SizedBox(
              height: 160.0,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.containerMargin),
                scrollDirection: Axis.horizontal,
                reverse: true, // RTL horizontal list
                itemCount: accounts.length,
                itemBuilder: (context, index) {
                  final account = accounts[index];
                  return WalletCreditCard(account: account);
                },
              ),
            ),
            const SizedBox(height: 32.0),

            // Bank Accounts Connections Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.containerMargin),
              child: Text(
                'الربط البنكي والمزامنة',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: AppTheme.onSurface,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(height: 12.0),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.containerMargin),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'تحديث تلقائي',
                          style: TextStyle(color: AppTheme.secondary, fontWeight: FontWeight.bold, fontSize: 11.0),
                        ),
                        Row(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'مصرف الراجحي',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                                ),
                                Text(
                                  'آخر مزامنة: منذ ساعتين',
                                  style: TextStyle(color: AppTheme.onSurfaceVariant, fontSize: 11.0),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16.0),
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: AppTheme.primary.withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.sync, color: AppTheme.primary),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            // Sync account button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.containerMargin),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('ربط حساب بنكي جديد', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  minimumSize: const Size.fromHeight(56.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WalletAccountData {
  final String accountName;
  final String accountType;
  final double balance;
  final List<Color> gradientColors;

  const WalletAccountData({
    required this.accountName,
    required this.accountType,
    required this.balance,
    required this.gradientColors,
  });
}
