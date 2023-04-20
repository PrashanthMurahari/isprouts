import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:isprouts/practice/Stocks/Cafeteria/cafeteria_page.dart';
import 'package:isprouts/practice/Stocks/daily_consumable.dart';
import 'package:isprouts/practice/Stocks/hk.dart';
import 'package:isprouts/practice/Stocks/stationary.dart';

import '../../firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( MaterialApp(
    theme: ThemeData.light().copyWith(
      unselectedWidgetColor: Colors.red
    ),
    debugShowCheckedModeBanner: false,
    home:const Stocks(),
  ));
}
  
class Stocks extends StatefulWidget {
  const Stocks({Key? key}) : super(key: key);

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stocks',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DailyConsumable()));
                },
                child: const Text('Daily Consumable')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Cafeteria()));
                },
                child: const Text('Cafeteria Materials')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HK()));
                },
                child: const Text('HK')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Stationary()));
                },
                child: const Text('Stationary items')),
          ],
        ),
      ),
    );
  }
}
