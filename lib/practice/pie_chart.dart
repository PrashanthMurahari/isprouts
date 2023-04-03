import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PieCharts(),
    ));

class PieCharts extends StatefulWidget {
  const PieCharts({Key? key}) : super(key: key);

  @override
  State<PieCharts> createState() => _PieChartsState();
}

class _PieChartsState extends State<PieCharts> {
  Map<String, double> dataMap = {
    'CSK': 4,
    "MI": 5,
    "RCB": 0,
    "KKR": 2,
    "RR": 1,
    "SRH": 1,
    "KX1p": 1,
    'DD': 1
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pie Chart',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: PieChart(
          dataMap: dataMap,
          chartRadius: MediaQuery.of(context).size.width / 3,
          legendOptions: const LegendOptions(
            legendPosition: LegendPosition.right,
          ),
          chartValuesOptions: const ChartValuesOptions(
            showChartValuesInPercentage: true,
          ),
        ),
      ),
    );
  }
}
