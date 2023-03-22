import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: MyApp()
));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF128C7E),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.chat),),
                Tab(icon: Icon(Icons.call),),
                Tab(icon: Icon(Icons.album),)
              ],

            ),
            title: Text('WhatsApp',
            style: TextStyle(
                fontSize: 30.0,
              color: Colors.white,
            ),
            ),
            centerTitle: false,
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text('Chat'),
              ),
              Center(
                child: Text('Calls'),
              ),
              Center(
                child: Text('Status'),
              ),
            ],
          ),
        ));
  }
}
