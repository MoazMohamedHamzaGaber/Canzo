import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/analytic_entity.dart';

class RevenueCard extends StatelessWidget {
  final AnalyticsEntity analytics;

  const RevenueCard({
    super.key,
    required this.analytics,
  });

  @override
  Widget build(BuildContext context) {
    final spots = analytics.chart
        .asMap()
        .entries
        .map(
          (e) => FlSpot(
        e.key.toDouble(),
        e.value.totalProfit,
      ),
    )
        .toList();

    final maxProfit = analytics.chart.isEmpty
        ? 100.0
        : analytics.chart
        .map((e) => e.totalProfit)
        .reduce((a, b) => a > b ? a : b);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.revenue.tr(),
          style: StyleText.style16.copyWith(
            color: AppColors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        sizeBox(),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              Container(
                height: 160,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: LineChart(
                  LineChartData(
                    minX: 0,
                    maxX: analytics.chart.isEmpty
                        ? 0
                        : (analytics.chart.length - 1).toDouble(),
                    minY: 0,
                    maxY: maxProfit + (maxProfit * .2),

                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),

                    titlesData: FlTitlesData(
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),

                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          getTitlesWidget: (value, meta) {
                            final index = value.toInt();

                            if (index >= analytics.chart.length) {
                              return const SizedBox();
                            }

                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                analytics.chart[index].day,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    lineBarsData: [
                      LineChartBarData(
                        isCurved: true,
                        color: AppColors.green,
                        barWidth: 3,
                        spots: spots,

                        dotData: FlDotData(
                          show: true,
                          getDotPainter:
                              (spot, percent, bar, index) =>
                              FlDotCirclePainter(
                                radius: 4,
                                color: AppColors.green,
                                strokeWidth: 0,
                              ),
                        ),

                        belowBarData: BarAreaData(
                          show: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              sizeBox(),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.totalThisWeek.tr(),
                    style: StyleText.style18.copyWith(
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    "${analytics.totalProfit.toStringAsFixed(0)} ${AppStrings.egp.tr()}",
                    style: StyleText.style18.copyWith(
                      color: AppColors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}