import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 20.0),
            width: double.infinity,
            height: double.infinity,
            child: const Text('Dashboard',
              style:TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                ),
            ),
          ),
          Column(
            children: const [
              Text('users dashboard ',
              style: TextStyle(
                fontSize: 30.0,
                
              ),
              ),
              Text('this is only for viewing purpose')
            ],
          )
        ],
      ),
    );
  }
}
