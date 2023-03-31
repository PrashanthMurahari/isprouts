import 'package:flutter/material.dart';

void main() =>runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: DashBoardMaking(),
));

class DashBoardMaking extends StatefulWidget {
  const DashBoardMaking({Key? key}) : super(key: key);

  @override
  State<DashBoardMaking> createState() => _DashBoardMakingState();
}

class _DashBoardMakingState extends State<DashBoardMaking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 1000,
          color: Colors.grey[100],
          child: Wrap(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin:const EdgeInsets.all(10),
                color: Colors.white,
                child: const Text('Area'),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                color: Colors.white,
                child: Text('Area'),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: Text('Area'),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: Text('Area'),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: Text('Area'),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: Text('Area'),
              ),Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: Text('Area'),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: Text('Area'),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: Text('Area'),
              ),Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: Text('Area'),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: Text('Area'),
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Text('hi'),
              )
            ],
          )
        ),
      ),
    );
  }
}
