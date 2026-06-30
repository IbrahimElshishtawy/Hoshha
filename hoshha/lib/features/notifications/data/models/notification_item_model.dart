import 'package:flutter/material.dart';
import '../../../../core/utils/icon_helper.dart';
import '../../domain/entities/notification_item.dart';

class NotificationItemModel extends NotificationItem {
  const NotificationItemModel({
    required super.title,
    required super.body,
    required super.time,
    required super.icon,
    required super.iconColor,
    required super.isRead,
  });

  factory NotificationItemModel.fromJson(Map<String, dynamic> json) {
    return NotificationItemModel(
      title: json['title'] as String,
      body: json['body'] as String,
      time: json['time'] as String,
      icon: IconHelper.getIcon(json['iconKey'] as String),
      iconColor: Color(json['iconColorValue'] as int),
      isRead: json['isRead'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'time': time,
      'iconKey': IconHelper.getKey(icon),
      'iconColorValue': iconColor.toARGB32(),
      'isRead': isRead,
    };
  }
}
