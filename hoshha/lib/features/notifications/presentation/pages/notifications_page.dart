import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/notification_list_item.dart';

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
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: NotificationListItem(item: item),
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
