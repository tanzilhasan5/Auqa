import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utils/App_Color/app_color.dart';

class MonthlyHydrate extends StatelessWidget {
  final List<double> drinkPercentages = const [
    0,
    1.2,
    2,
    1.2,
    2,
    2.4,
    0.3,
    0.3,
    0.3,
  ];

  const MonthlyHydrate({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: LineChart(
        LineChartData(
          maxY: 2.5,
          minY: 0,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40.w,
                interval: 0.5,
                getTitlesWidget: (value, meta) {
                  return Text(
                    '${value.toStringAsFixed(1)}L',
                    style: TextStyle(color: Colors.black54, fontSize: 13.sp),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                maxIncluded: true,

                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const days = ["1","3","5","7","9","11","13","15","17","19","21","23","25","27","29","31"]
                  ;
                  if (value.toInt() >= 0 && value.toInt() < days.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        days[value.toInt()],
                        style: const TextStyle(fontSize: 8),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: drinkPercentages.asMap().entries.map((entry) {
                return FlSpot(entry.key.toDouble(), entry.value);
              }).toList(),
              isCurved: true,
              color: const Color(0xFF4A90E2),
              barWidth: 3,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  bool isHighlighted = index == 2;
                  return FlDotCirclePainter(
                    radius: isHighlighted ? 6 : 4,
                    color: isHighlighted
                        ? const Color(0xFF4A90E2)
                        : Colors.white,
                    strokeWidth: 2,
                    strokeColor: const Color(0xFF4A90E2),
                  );
                },
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF9FD1FF).withOpacity(0.3),
                    const Color(0xFF9FD1FF).withOpacity(0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (touchedSpot) => Colors.white,
              tooltipBorder: BorderSide(
                color: AppColor.primarryColor,
                width: 2,
              ),
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((spot) {
                  if (spot.x == 2) {
                    return LineTooltipItem(
                      '${spot.y.toStringAsFixed(1)}L',
                      const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  return null;
                }).toList();
              },
            ),
            getTouchedSpotIndicator: (barData, spotIndexes) {
              return spotIndexes.map((index) {
                return TouchedSpotIndicatorData(
                  FlLine(color: Colors.transparent),
                  FlDotData(show: false),
                );
              }).toList();
            },
          ),
        ),
      ),
    );
  }
}