import 'package:canzo_app/feature/admin/overview/domain/entity/wallet_entity.dart';

import '../../../../../core/error/failure.dart';
import '../../domain/entity/order_entity.dart';
import '../../domain/entity/withdraw_entity.dart';

enum OverviewStates {
  initial,
  loading,
  success,
  error,
  updateLoading,
  updateSuccess,
}

class OverviewState {

  final OverviewStates status;
  final Failure? failure;

  final List<OrderEntity> orders;

  final String? message;
  final WalletAdminEntity? wallet;
  final List<WithdrawalEntity>? withdraw;

  const OverviewState({
    this.status = OverviewStates.initial,
    this.failure,
    this.orders = const [],
    this.message,
    this.wallet,
    this.withdraw,
  });

  OverviewState copyWith({
    OverviewStates? status,
    Failure? failure,
    List<OrderEntity>? orders,
    String? message,
    WalletAdminEntity? wallet,
    List<WithdrawalEntity>? withdraw,
  }) {
    return OverviewState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      orders: orders ?? this.orders,
      message: message ?? this.message,
      wallet: wallet ?? this.wallet,
      withdraw: withdraw ?? this.withdraw,
    );
  }
}