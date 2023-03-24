import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:isprouts/firebase_options.dart';
import 'package:isprouts/log_In_page/log_in_page.dart';
import 'package:isprouts/log_In_page/otp_page.dart';
import 'package:isprouts/log_In_page/dashboard.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(

    initialRoute: '/login',
    routes: {
      '/login':(context) => const LogIn(),
      '/otp':(context) => const OneTimePassword(),
      '/dashboard':(context) => const DashBoard(),
    },
  ));
}
