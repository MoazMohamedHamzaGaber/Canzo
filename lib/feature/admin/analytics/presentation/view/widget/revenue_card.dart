import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RevenueCard extends StatelessWidget {
  const RevenueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
        AppStrings.revenue.tr(),
          style: StyleText.style16.copyWith(
            color: AppColors.green,
            fontWeight: FontWeight.bold
          ),
        ),
        sizeBox(),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20
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
                    maxX: 6,
                    minY: 0,
                    maxY: 100,

                    /// remove grid
                    gridData: FlGridData(show: false),

                    /// remove borders
                    borderData: FlBorderData(show: false),

                    /// remove left numbers
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),

                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),

                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),

                      /// 👇 الأيام هنا
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          getTitlesWidget: (value, meta) {
                            final days = [
                              AppStrings.sat.tr(),
                              AppStrings.sun.tr(),
                              AppStrings.mon.tr(),
                              AppStrings.tue.tr(),
                              AppStrings.wed.tr(),
                              AppStrings.thu.tr(),
                              AppStrings.fri.tr()
                            ];

                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                days[value.toInt()],
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

                    /// line data
                    lineBarsData: [
                      LineChartBarData(
                        isCurved: true,
                        color: const Color(0xff4CAF50),
                        barWidth: 3,

                        /// dots
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, bar, index) {
                            return FlDotCirclePainter(
                              radius: 4,
                              color: const Color(0xff4CAF50),
                              strokeWidth: 0,
                            );
                          },
                        ),

                        /// remove area under line
                        belowBarData: BarAreaData(show: false),

                        /// 👇 نفس الداتا بتاعتك
                        spots: const [
                          FlSpot(0, 30),
                          FlSpot(1, 35),
                          FlSpot(2, 40),
                          FlSpot(3, 38),
                          FlSpot(4, 45),
                          FlSpot(5, 50),
                          FlSpot(6, 70),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              sizeBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text(
                    AppStrings.totalThisWeek.tr(),
                    style: StyleText.style18.copyWith(
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    "${AppStrings.egp.tr()} 1,000",
                    style: StyleText.style18.copyWith(
                      color: AppColors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}