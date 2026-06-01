class AnalyticsEntity {
  final List<ChartEntity> chart;
  final double plasticWeight;
  final double canzWeight;
  final double totalProfit;

  const AnalyticsEntity({
    required this.chart,
    required this.plasticWeight,
    required this.canzWeight,
    required this.totalProfit,
  });
}

class ChartEntity {
  final String day;
  final int totalPackages;
  final double totalProfit;

  const ChartEntity({
    required this.day,
    required this.totalPackages,
    required this.totalProfit,
  });
}