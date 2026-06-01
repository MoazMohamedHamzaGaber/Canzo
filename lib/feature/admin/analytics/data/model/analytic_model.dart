
import '../../domain/entity/analytic_entity.dart';

class AnalyticsModel extends AnalyticsEntity {
  const AnalyticsModel({
    required super.chart,
    required super.plasticWeight,
    required super.canzWeight,
    required super.totalProfit,
  });

  factory AnalyticsModel.fromJson(Map<String, dynamic> json) {
    return AnalyticsModel(
      chart: (json['chart'] as List)
          .map((e) => ChartModel.fromJson(e))
          .toList(),

      plasticWeight:
      (json['materialsWeightSoldThisWeek'][0]['plastic_weight'] as num)
          .toDouble(),

      canzWeight:
      (json['materialsWeightSoldThisWeek'][0]['canz_weight'] as num)
          .toDouble(),

      totalProfit:
      (json['profitsThisWeek'][0]['total_profit'] as num)
          .toDouble(),
    );
  }
}

class ChartModel extends ChartEntity {
  const ChartModel({
    required super.day,
    required super.totalPackages,
    required super.totalProfit,
  });

  factory ChartModel.fromJson(Map<String, dynamic> json) {
    return ChartModel(
      day: json['day'],
      totalPackages: json['total_packages'],
      totalProfit: (json['total_profit'] as num).toDouble(),
    );
  }
}