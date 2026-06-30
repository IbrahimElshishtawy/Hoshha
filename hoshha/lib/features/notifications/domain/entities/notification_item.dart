import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NotificationItem extends Equatable {
  final String title;
  final String body;
  final String time;
  final IconData icon;
  final Color iconColor;
  final bool isRead;

  const NotificationItem({
    required this.title,
    required this.body,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.isRead,
  });

  @override
  List<Object?> get props => [title, body, time, icon, iconColor, isRead];
}
