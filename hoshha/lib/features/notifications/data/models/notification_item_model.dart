import 'package:flutter/material.dart';
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
      icon: IconData(json['iconCodePoint'] as int, fontFamily: 'MaterialIcons'),
      iconColor: Color(json['iconColorValue'] as int),
      isRead: json['isRead'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'time': time,
      'iconCodePoint': icon.codePoint,
      'iconColorValue': iconColor.value,
      'isRead': isRead,
    };
  }
}
