import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:isprouts/Isprout_app/Log_in/log_in_page.dart';
import 'package:isprouts/Isprout_app/Super_Admins_page/main_dashboard.dart';
import '../firebase_options.dart';
void main() async{
      await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login':(context)=>const LogIn(),
      '/dashboard':(context) => const DashBoard(),
    },
  )
      );
}