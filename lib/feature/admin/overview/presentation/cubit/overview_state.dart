import 'package:canzo_app/feature/admin/overview/domain/entity/wallet_entity.dart';

import '../../../../../core/error/failure.dart';
import '../../domain/entity/order_entity.dart';
import '../../domain/entity/withdraw_entity.dart';

enum OverviewStates {
  initial,
  loading,
  success,
  error,
  updateSuccess,
}

class OverviewState {

  final OverviewStates status;
  final Failure? failure;

  final List<OrderEntity> orders;

  final String? message;
  final WalletAdminEntity? wallet;
  final List<WithdrawalEntity>? withdraw;
  final int? loadingWithdrawId;
  final String? loadingAction;
  final int? loadingOrderId;
  final String? loadingOrderAction;

  const OverviewState({
    this.status = OverviewStates.initial,
    this.failure,
    this.orders = const [],
    this.message,
    this.wallet,
    this.withdraw,
    this.loadingAction,
    this.loadingWithdrawId,
    this.loadingOrderAction,
    this.loadingOrderId,
  });

  static const _unset = Object();

  OverviewState copyWith({
    OverviewStates? status,
    Failure? failure,
    List<OrderEntity>? orders,
    String? message,
    WalletAdminEntity? wallet,
    List<WithdrawalEntity>? withdraw,
    Object? loadingWithdrawId = _unset,
    Object? loadingAction = _unset,
    Object? loadingOrderId = _unset,
    Object? loadingOrderAction = _unset,
  }) {
    return OverviewState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      orders: orders ?? this.orders,
      message: message ?? this.message,
      wallet: wallet ?? this.wallet,
      withdraw: withdraw ?? this.withdraw,
      loadingWithdrawId: loadingWithdrawId == _unset
          ? this.loadingWithdrawId
          : loadingWithdrawId as int?,
      loadingAction: loadingAction == _unset
          ? this.loadingAction
          : loadingAction as String?,
      loadingOrderId: loadingOrderId == _unset
          ? this.loadingOrderId
          : loadingOrderId as int?,

      loadingOrderAction: loadingOrderAction == _unset
          ? this.loadingOrderAction
          : loadingOrderAction as String?,
    );
  }
}
