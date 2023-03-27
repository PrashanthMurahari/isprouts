import 'package:flutter/material.dart';

class SalesPersonDashboard extends StatefulWidget {
  const SalesPersonDashboard({Key? key}) : super(key: key);

  @override
  State<SalesPersonDashboard> createState() => _SalesPersonDashboardState();
}

class _SalesPersonDashboardState extends State<SalesPersonDashboard> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Text('sales'),
    );
  }
}
