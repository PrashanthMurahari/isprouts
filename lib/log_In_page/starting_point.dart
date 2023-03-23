import 'package:flutter/material.dart';
import 'package:isprouts/log_In_page/log_in_page.dart';
import 'package:isprouts/log_In_page/otp_page.dart';
import 'package:isprouts/log_In_page/dashboard.dart';
void main() =>runApp(MaterialApp(
  initialRoute: '/login',
  routes: {
      '/login':(context) => const LogIn(),
      '/otp':(context) => const OneTimePassword(),
      '/dashboard':(context) => const DashBoard(),
  },
));
