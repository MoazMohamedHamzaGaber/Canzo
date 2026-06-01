import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/feature/admin/analytics/domain/useCase/get_analytic_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'analytics_state.dart';

class AnalyticsCubit extends Cubit<AnalyticsState> {
  final GetAnalyticUseCase _analyticUseCase;

  AnalyticsCubit(this._analyticUseCase) : super(const AnalyticsState());

  Future<void> getBaskets() async {
    emit(state.copyWith(status: AnalyticsStates.loading));

    final response = await _analyticUseCase(NoParams());
    response.fold(
      (l) {
        emit(state.copyWith(failure: l, status: AnalyticsStates.error));
      },
      (analytics) {
        emit(
          state.copyWith(analytics: analytics, status: AnalyticsStates.success),
        );
      },
    );
  }
}
