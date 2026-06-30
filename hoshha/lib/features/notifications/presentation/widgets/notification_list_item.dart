import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../pages/notifications_page.dart';

class NotificationListItem extends StatelessWidget {
  final NotificationData item;

  const NotificationListItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
  }
}
