import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Dashboard',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: const [
                  Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                    size: 14,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 14,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Name',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
