import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class WalletAccount extends Equatable {
  final String accountName;
  final String accountType;
  final double balance;
  final List<Color> gradientColors;

  const WalletAccount({
    required this.accountName,
    required this.accountType,
    required this.balance,
    required this.gradientColors,
  });

  @override
  List<Object?> get props => [accountName, accountType, balance, gradientColors];
}
