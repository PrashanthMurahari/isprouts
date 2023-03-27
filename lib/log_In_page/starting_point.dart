import 'package:flutter/material.dart';
import 'package:isprouts/log_In_page/admins_dashboard.dart';
import 'package:isprouts/log_In_page/log_in_page.dart';
import 'package:isprouts/log_In_page/receptionist_numbers.dart';
import 'package:isprouts/log_In_page/sales_persons_dashboard.dart';
import 'package:isprouts/log_In_page/users_dashboard.dart';

void main() async {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/login': (context) => const LogIn(),
      '/user_dashboard': (context) => const UserDashboard(),
      '/admins_dashboard': (context) => const AdminsDashboard(),
      '/sales_persons_dashboard': (context) => const SalesPersonDashboard(),
      '/receptionists_dashboard': (context) => const Receptionists(),
    },
  ));
}
