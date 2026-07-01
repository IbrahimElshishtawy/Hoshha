import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../injection_container.dart';
import '../cubit/notifications_cubit.dart';
import '../cubit/notifications_state.dart';
import '../widgets/notification_list_item.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => sl<NotificationsCubit>()..loadNotifications(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'الإشعارات والأنشطة',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppTheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 2.0,
          shadowColor: Colors.black12,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppTheme.onSurfaceVariant),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            if (state is NotificationsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary),
                ),
              );
            }

            if (state is NotificationsLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(AppTheme.containerMargin),
                itemCount: state.notifications.length,
                itemBuilder: (context, index) {
                  final item = state.notifications[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: NotificationListItem(item: item),
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
