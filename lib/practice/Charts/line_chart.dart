import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(const MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Charts"),
        ),
        body: LineChart(
          LineChartData(minX: 0, minY: 0, maxY: 5, maxX: 5, lineBarsData: [
            LineChartBarData(spots: const [
              FlSpot(0, 1),
              FlSpot(1, 1.2),
              FlSpot(1.5, 1.9),
              FlSpot(2, 2.5),
              FlSpot(3, 1.5),
              FlSpot(3.5, 1),
              FlSpot(4, 3),
            ], isCurved: true, dotData: FlDotData(show: false))
          ]),
        ));
  }
}
