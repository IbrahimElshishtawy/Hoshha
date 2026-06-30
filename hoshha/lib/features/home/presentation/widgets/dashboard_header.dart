import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class DashboardHeader extends StatelessWidget implements PreferredSizeWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 70.0 + MediaQuery.of(context).padding.top,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8.0,
        left: AppTheme.containerMargin,
        right: AppTheme.containerMargin,
        bottom: 8.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        border: const Border(
          bottom: BorderSide(color: AppTheme.surfaceContainer, width: 1.0),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Greeting text on the right (start)
          Text(
            'صباح الخير، إبراهيم 👋',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppTheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Profile pic and notification bell on the left (end)
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_none,
                  color: AppTheme.primary,
                  size: 28.0,
                ),
                onPressed: () {
                  // Navigate to Notifications
                },
              ),
              const SizedBox(width: 8.0),
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppTheme.primaryFixedDim,
                    width: 2.0,
                  ),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuBMhVp-08wY_Ut3wINUfgrH8WoBGD5nhERIo0lE6QSg_JYluoFzBDm8IcOUC2Zts612v-lmSONiTgiAgm0LoZNgadEBiByHUogn8iCs-occ5Gid2u-61a-Al40Cjt9f3ooHpqvwXlNHwngAYhqEU4UbwbeDDmniigOFfZqZdKKtxNWJ0HeZRAqbPd8Xq5t3j3XsFQkt0E6z1rYguxwSw7IkxjOGCVxQoZLYo0hpZ3tsxIvx0nsOQkiEYiNEyqG250uVzCsljjC2eckv',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
