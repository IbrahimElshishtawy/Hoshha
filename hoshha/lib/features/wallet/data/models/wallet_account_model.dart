import 'package:flutter/material.dart';
import '../../domain/entities/wallet_account.dart';

class WalletAccountModel extends WalletAccount {
  const WalletAccountModel({
    required super.accountName,
    required super.accountType,
    required super.balance,
    required super.gradientColors,
  });

  factory WalletAccountModel.fromJson(Map<String, dynamic> json) {
    final colorsList = (json['gradientColors'] as List<dynamic>?)
            ?.map((c) => Color(c as int))
            .toList() ??
        <Color>[];

    return WalletAccountModel(
      accountName: json['accountName'] as String,
      accountType: json['accountType'] as String,
      balance: (json['balance'] as num).toDouble(),
      gradientColors: colorsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountName': accountName,
      'accountType': accountType,
      'balance': balance,
      'gradientColors': gradientColors.map((c) => c.toARGB32()).toList(),
    };
  }
}
