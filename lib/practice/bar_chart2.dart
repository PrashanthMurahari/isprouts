import 'package:charts_flutter_new/flutter.dart' as charts;
class BarChartModel{
  String country;
  int cups;
  final charts.Color color;

  BarChartModel({
    required this.country,
    required this.cups,
    required this.color
});
}