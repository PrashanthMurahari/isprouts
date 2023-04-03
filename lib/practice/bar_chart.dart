import 'package:flutter/material.dart';
import 'bar_chart2.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BarCharts(),
  ));
}

class BarCharts extends StatefulWidget {
  const BarCharts({Key? key}) : super(key: key);

  @override
  State<BarCharts> createState() => _BarChartsState();
}

class _BarChartsState extends State<BarCharts> {
  final List<BarChartModel> data = [
    BarChartModel(
        country: 'CSK',
        cups: 4,
        color: charts.ColorUtil.fromDartColor(Colors.lightGreenAccent)),
    BarChartModel(
        country: 'MI',
        cups: 5,
        color: charts.ColorUtil.fromDartColor(Colors.grey)),
    BarChartModel(
        country: 'SRH',
        cups: 2,
        color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent)),
    BarChartModel(
        country: 'KKR',
        cups: 2,
        color: charts.ColorUtil.fromDartColor(Colors.redAccent)),
    BarChartModel(
        country: 'DD',
        cups: 1,
        color: charts.ColorUtil.fromDartColor(Colors.deepOrange)),
    BarChartModel(
        country: 'RCB',
        cups: 1,
        color: charts.ColorUtil.fromDartColor(Colors.greenAccent)),
    BarChartModel(
        country: 'KX1P',
        cups: 1,
        color: charts.ColorUtil.fromDartColor(Colors.brown)),
    BarChartModel(
        country: 'RR',
        cups: 1,
        color: charts.ColorUtil.fromDartColor(Colors.pinkAccent)),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: 'Cups',
        data: data,
        domainFn: (BarChartModel series, _) => series.country,
        measureFn: (BarChartModel series, _) => series.cups,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bar chart',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: charts.BarChart(
          series,
          animate: true,
        ),
      ),
    );
  }
}
