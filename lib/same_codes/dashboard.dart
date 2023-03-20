import 'package:flutter/material.dart';
import 'package:isprouts/sample_projects/dashboard.dart';

void main() => runApp(MaterialApp(
  home: DashBoard()
));
class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
    );
  }
}
