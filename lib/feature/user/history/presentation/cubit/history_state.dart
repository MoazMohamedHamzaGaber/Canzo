import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/user/history/domain/entity/order_status_entity.dart';

enum HistoryStates { loading, initial, error , success}

class HistoryState {
  final HistoryStates status;
  final Failure? failure;
  final List<OrderStatusEntity>? orders;

  const HistoryState({
    this.status = HistoryStates.initial,
    this.failure,
    this.orders
  });

  HistoryState copyWith({
    HistoryStates? status,
    Failure? failure,
    List<OrderStatusEntity>? orders,
  }) {
    return HistoryState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      orders: orders ?? this.orders,
    );
  }
}
