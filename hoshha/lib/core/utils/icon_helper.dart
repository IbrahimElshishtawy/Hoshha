import 'package:flutter/material.dart';

class IconHelper {
  IconHelper._();

  static IconData getIcon(String key) {
    switch (key) {
      case 'restaurant':
        return Icons.restaurant;
      case 'shopping_basket':
        return Icons.shopping_basket;
      case 'shopping_bag':
        return Icons.shopping_bag;
      case 'sports_esports':
        return Icons.sports_esports;
      case 'electric_bolt':
        return Icons.electric_bolt;
      case 'wifi':
        return Icons.wifi;
      case 'movie_filter':
        return Icons.movie_filter;
      case 'directions_car':
        return Icons.directions_car;
      case 'category':
        return Icons.category;
      case 'account_balance_wallet':
        return Icons.account_balance_wallet;
      case 'warning':
        return Icons.warning_amber_rounded;
      case 'auto_awesome':
        return Icons.auto_awesome;
      default:
        return Icons.help_outline;
    }
  }

  static String getKey(IconData icon) {
    if (icon == Icons.restaurant) return 'restaurant';
    if (icon == Icons.shopping_basket) return 'shopping_basket';
    if (icon == Icons.shopping_bag) return 'shopping_bag';
    if (icon == Icons.sports_esports) return 'sports_esports';
    if (icon == Icons.electric_bolt) return 'electric_bolt';
    if (icon == Icons.wifi) return 'wifi';
    if (icon == Icons.movie_filter) return 'movie_filter';
    if (icon == Icons.directions_car) return 'directions_car';
    if (icon == Icons.category) return 'category';
    if (icon == Icons.account_balance_wallet) return 'account_balance_wallet';
    if (icon == Icons.warning_amber_rounded) return 'warning';
    if (icon == Icons.auto_awesome) return 'auto_awesome';
    return 'help';
  }
}
