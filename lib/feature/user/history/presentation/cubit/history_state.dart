import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/user/history/domain/entity/order_status_entity.dart';

enum HistoryStates { loading, initial, error , success}

class HistoryState {
  final HistoryStates status;
  final Failure? failure;
  final List<OrderStatusEntity>? pendingOrders;
  final List<OrderStatusEntity>? cancelledOrders;
  final List<OrderStatusEntity>? completedOrders;

  const HistoryState({
    this.status = HistoryStates.initial,
    this.failure,
    this.pendingOrders,
    this.cancelledOrders,
    this.completedOrders,
  });

  HistoryState copyWith({
    HistoryStates? status,
    Failure? failure,
    List<OrderStatusEntity>? pendingOrders,
     List<OrderStatusEntity>? cancelledOrders,
     List<OrderStatusEntity>? completedOrders,
  }) {
    return HistoryState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      pendingOrders: pendingOrders ?? this.pendingOrders,
      cancelledOrders: cancelledOrders ?? this.cancelledOrders,
      completedOrders: completedOrders ?? this.completedOrders,
    );
  }
}
