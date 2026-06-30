import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class WalletManagementPage extends StatelessWidget {
  const WalletManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Mock data for wallets
    final wallets = [
      const WalletItemData(
        name: 'البنك الأهلي السعودي',
        balance: 32450.00,
        type: 'حساب بنكي',
        cardNumber: '**** **** **** 1024',
        gradientColors: [Color(0xFF004AC6), Color(0xFF2563EB)],
        logo: Icons.account_balance,
      ),
      const WalletItemData(
        name: 'بطاقة السفر الائتمانية',
        balance: 4800.00,
        type: 'بطاقة ائتمان',
        cardNumber: '**** **** **** 5098',
        gradientColors: [Color(0xFF006C49), Color(0xFF4EDE9C)],
        logo: Icons.credit_card,
      ),
      const WalletItemData(
        name: 'المحفظة النقدية',
        balance: 8000.00,
        type: 'نقد (كاش)',
        cardNumber: 'نقدي شخصي',
        gradientColors: [Color(0xFFAB0B1C), Color(0xFFFF8E95)],
        logo: Icons.payments,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المحفظة والحسابات',
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
        padding: const EdgeInsets.all(AppTheme.containerMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Net Worth Summary Card
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(AppTheme.radiusCard),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'صافي الثروة المتاحة',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: AppTheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'ريال',
                        style: TextStyle(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        '45,250.00',
                        style: TextStyle(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 32.0,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'الالتزامات',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: AppTheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          const Text(
                            '12,000 ريال',
                            style: TextStyle(
                              color: AppTheme.error,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'الأصول الإجمالية',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: AppTheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          const Text(
                            '57,250 ريال',
                            style: TextStyle(
                              color: AppTheme.secondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),

            // Header for Wallets
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.add_circle_outline, color: AppTheme.primary),
                  onPressed: () {},
                ),
                Text(
                  'الحسابات والمحافظ المفعلة',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: AppTheme.onSurface,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),

            // Wallets list
            ...wallets.map((wallet) {
              return Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: wallet.gradientColors,
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: wallet.gradientColors[0].withValues(alpha: 0.3),
                      blurRadius: 12.0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          wallet.logo,
                          color: Colors.white.withValues(alpha: 0.8),
                          size: 28.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              wallet.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              wallet.type,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.7),
                                fontSize: 11.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          wallet.cardNumber,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                            fontSize: 12.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'ريال',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              wallet.balance.toStringAsFixed(2),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 16.0),

            // Quick Operations Row
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.pushNamed(context, '/bills'),
                    icon: const Icon(Icons.receipt_long, color: AppTheme.primary),
                    label: const Text('منبه الفواتير', style: TextStyle(color: AppTheme.primary)),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      side: const BorderSide(color: AppTheme.outlineVariant),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.pushNamed(context, '/debt'),
                    icon: const Icon(Icons.handshake, color: AppTheme.primary),
                    label: const Text('مجدول الديون', style: TextStyle(color: AppTheme.primary)),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      side: const BorderSide(color: AppTheme.outlineVariant),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WalletItemData {
  final String name;
  final double balance;
  final String type;
  final String cardNumber;
  final List<Color> gradientColors;
  final IconData logo;

  const WalletItemData({
    required this.name,
    required this.balance,
    required this.type,
    required this.cardNumber,
    required this.gradientColors,
    required this.logo,
  });
}
