import 'package:equatable/equatable.dart';
import '../../domain/entities/wallet_account.dart';

abstract class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object?> get props => [];
}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletLoaded extends WalletState {
  final List<WalletAccount> accounts;
  final double netWorth;
  final double assets;
  final double liabilities;

  const WalletLoaded({
    required this.accounts,
    required this.netWorth,
    required this.assets,
    required this.liabilities,
  });

  @override
  List<Object?> get props => [accounts, netWorth, assets, liabilities];
}
