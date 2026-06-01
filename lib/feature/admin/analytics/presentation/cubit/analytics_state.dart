import 'package:canzo_app/core/error/failure.dart';
import 'package:canzo_app/feature/admin/analytics/domain/entity/analytic_entity.dart';

enum AnalyticsStates { loading, initial, error , success}

class AnalyticsState {
  final AnalyticsStates status;
  final Failure? failure;
  final AnalyticsEntity? analytics;

  const AnalyticsState({
    this.status = AnalyticsStates.initial,
    this.failure,
    this.analytics
  });

  AnalyticsState copyWith({
    AnalyticsStates? status,
    Failure? failure,
    AnalyticsEntity? analytics,
  }) {
    return AnalyticsState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      analytics: analytics ?? this.analytics,

    );
  }
}
