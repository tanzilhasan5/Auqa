import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utils/App_Color/app_color.dart';


class DrinkCompletionChart extends StatelessWidget {
  const DrinkCompletionChart({super.key});

  final List<double> drinkPercentages = const [
    100,
    25,
    60,
    85,
    100,
    45,

  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child:
      BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 100,


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
                interval: 20,
                getTitlesWidget: (value, meta) {
                  return Text(
                    '${value.toInt()}%',
                    style: TextStyle(color: Colors.black54, fontSize: 13.sp),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(days[value.toInt()],
                        style: const TextStyle(fontSize: 12)),
                  );
                },
              ),
            ),
          ),
          barGroups: drinkPercentages.asMap().entries.map((entry) {
            int index = entry.key;
            double value = entry.value;

            bool isHighlighted = index == 2;


            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: value,
                  color: isHighlighted
                      ? const Color(0xFF4A90E2)
                      : const Color(0xFF9FD1FF),
                  width: 30,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                ),
              ],
              showingTooltipIndicators: isHighlighted ? [0] : [],
            );
          }).toList(),
          barTouchData: BarTouchData(
            enabled: false,
            touchTooltipData: BarTouchTooltipData(

              tooltipBorderRadius: BorderRadius.circular(30),
              tooltipBorder: BorderSide(
                  color: AppColor.primarryColor,

                  width: 2
              ),
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                if (group.x == 2) {

                  return BarTooltipItem(

                    '60%',
                    const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),

                  );
                }
                return null;
              },
            ),
          ),
        ),
      ),
    );
  }
}