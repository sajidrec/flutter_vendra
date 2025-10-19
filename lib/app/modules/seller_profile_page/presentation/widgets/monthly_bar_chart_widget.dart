import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';

class MonthlySalesChartWidget extends StatelessWidget {
  MonthlySalesChartWidget({super.key}); // Example data (Jan–Jul)

  final List<double> salesData = [8, 2.5, 9, 8, 10, 7, 9];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: BarChart(
        BarChartData(
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: Colors.grey.withAlpha((255 * .3).round()),
            ),
          ),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  if (value == 0) {
                    return Text("0");
                  } else {
                    return Text("${value.toInt()}k");
                  }
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  const months = [
                    'Jan',
                    'Feb',
                    'Mar',
                    'Apr',
                    'May',
                    'Jun',
                    'Jul',
                    'Aug',
                  ];
                  return Text(months[value.toInt() % months.length]);
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          barGroups: salesData.asMap().entries.map((entry) {
            int index = entry.key;
            double value = entry.value;
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: value,
                  color: AppColors.primarySuccess, // same green tone
                  width: 16,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
