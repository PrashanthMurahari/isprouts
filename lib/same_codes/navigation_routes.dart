import 'package:flutter/material.dart';
import './practice.dart';
import './dashboard.dart';

void main() =>runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home':(context) => MyApp(),
    '/dashboard':(context) => Dashboard(),
  },
));