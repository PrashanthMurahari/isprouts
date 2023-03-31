import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineCharts extends StatelessWidget {
  const LineCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        minY: 0,
        maxY: 4,
        maxX: 12,
        lineBarsData: [
          LineChartBarData(
            spots:const [
              FlSpot(0, 3),
              FlSpot(2, 5),
              FlSpot(1, 6),
              FlSpot(5, 10),
              FlSpot(6, 2),
              FlSpot(1, 20),
            ]
          )
        ]
      )
    );
  }
}
