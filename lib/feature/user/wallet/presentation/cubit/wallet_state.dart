import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/user/wallet/domain/entity/transaction_entity.dart';
import 'package:canzo_app/feature/user/wallet/domain/entity/wallet_entity.dart';

import '../../domain/entity/withdraw_entity.dart';

enum WalletStates { loading, initial, error ,addSuccess, success, fillSuccess}

class WalletState {
  final WalletStates status;
  final Failure? failure;
  final TransactionEntity? transaction;
  final WalletEntity? wallet;
  final List<WithdrawUserEntity>? withdraw;

  const WalletState({
    this.status = WalletStates.initial,
    this.failure,
    this.transaction,
    this.wallet,
    this.withdraw,
  });

  WalletState copyWith({
    WalletStates? status,
    Failure? failure,
    TransactionEntity? transaction,
     WalletEntity? wallet,
    List<WithdrawUserEntity>? withdraw
  }) {
    return WalletState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      transaction: transaction ?? this.transaction,
      wallet: wallet ?? this.wallet,
      withdraw: withdraw ?? this.withdraw,
    );
  }
}
