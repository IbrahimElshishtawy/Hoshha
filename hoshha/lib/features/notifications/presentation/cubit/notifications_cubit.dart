import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/notification_item.dart';
import 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());

  void loadNotifications() {
    emit(NotificationsLoading());

    // Mock load
    Future.delayed(const Duration(milliseconds: 300), () {
      emit(const NotificationsLoaded(
        notifications: [
          NotificationItem(
            title: 'تنبيه تجاوز الميزانية',
            body: 'لقد تجاوزت ميزانية الترفيه لشهر أكتوبر بنسبة 15%. ننصحك بمراجعة تقرير نفقاتك الأسبوعي.',
            time: 'منذ ساعتين',
            icon: Icons.warning_amber_rounded,
            iconColor: AppTheme.error,
            isRead: false,
          ),
          NotificationItem(
            title: 'فاتورة قادمة',
            body: 'تذكير: فاتورة الكهرباء مستحقة الدفع بعد يومين بمبلغ 350 ريال.',
            time: 'اليوم، 10:00 ص',
            icon: Icons.electric_bolt,
            iconColor: AppTheme.primary,
            isRead: false,
          ),
          NotificationItem(
            title: 'نصيحة هوشة للادخار',
            body: 'يمكنك توفير 500 ريال هذا الشهر من خلال تقليص نفقات المقاهي بمعدل 20%. هل تود تحديد ميزانية جديدة لها؟',
            time: 'أمس، 4:30 م',
            icon: Icons.auto_awesome,
            iconColor: AppTheme.secondary,
            isRead: true,
          ),
        ],
      ));
    });
  }
}
