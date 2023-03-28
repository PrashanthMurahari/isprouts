import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);
  @override
  State<UserDashboard> createState() => _UserDashboardState();
}
class _UserDashboardState extends State<UserDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu,color: Colors.deepOrangeAccent,),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },),
        backgroundColor: Colors.grey[100],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('viewing purpose')
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text('Main heading  ')),
            ListTile(
              title: Text('first'),
            ),
            ListTile(
              title: Text('second'),
            ),
            ListTile(
              title: Text('third'),
            ),
          ],
        ),
      ),
    );
  }
}
