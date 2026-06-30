import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Mock notifications data
    final notifications = [
      const NotificationData(
        title: 'تنبيه تجاوز الميزانية',
        body: 'لقد تجاوزت ميزانية الترفيه لشهر أكتوبر بنسبة 15%. ننصحك بمراجعة تقرير نفقاتك الأسبوعي.',
        time: 'منذ ساعتين',
        icon: Icons.warning_amber_rounded,
        iconColor: AppTheme.error,
        isRead: false,
      ),
      const NotificationData(
        title: 'فاتورة قادمة',
        body: 'تذكير: فاتورة الكهرباء مستحقة الدفع بعد يومين بمبلغ 350 ريال.',
        time: 'اليوم، 10:00 ص',
        icon: Icons.electric_bolt,
        iconColor: AppTheme.primary,
        isRead: false,
      ),
      const NotificationData(
        title: 'نصيحة هوشة للادخار',
        body: 'يمكنك توفير 500 ريال هذا الشهر من خلال تقليص نفقات المقاهي بمعدل 20%. هل تود تحديد ميزانية جديدة لها؟',
        time: 'أمس، 4:30 م',
        icon: Icons.auto_awesome,
        iconColor: AppTheme.secondary,
        isRead: true,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الإشعارات والأنشطة',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: AppTheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withValues(alpha: 0.7),
        elevation: 2.0,
        shadowColor: Colors.black12,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.onSurfaceVariant),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(AppTheme.containerMargin),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: item.isRead ? Colors.white.withValues(alpha: 0.6) : Colors.white.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(AppTheme.radiusCard),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0, 2),
                ),
              ],
              border: item.isRead
                  ? null
                  : Border.all(color: AppTheme.primary.withValues(alpha: 0.15), width: 1.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text info on the left
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.time,
                            style: const TextStyle(
                              color: AppTheme.onSurfaceVariant,
                              fontSize: 10.0,
                            ),
                          ),
                          Text(
                            item.title,
                            style: TextStyle(
                              color: AppTheme.onSurface,
                              fontWeight: item.isRead ? FontWeight.w600 : FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        item.body,
                        style: const TextStyle(
                          color: AppTheme.onSurfaceVariant,
                          fontSize: 12.0,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16.0),
                // Icon on the right
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: item.iconColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    item.icon,
                    color: item.iconColor,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class NotificationData {
  final String title;
  final String body;
  final String time;
  final IconData icon;
  final Color iconColor;
  final bool isRead;

  const NotificationData({
    required this.title,
    required this.body,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.isRead,
  });
}
