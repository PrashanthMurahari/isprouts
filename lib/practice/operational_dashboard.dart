import 'package:flutter/material.dart';
import '../Isprout_app/Super_Admins_page/button_page.dart';
import '../Isprout_app/Super_Admins_page/drawer_page.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OperationalDashboard(),
    ));

class OperationalDashboard extends StatefulWidget {
  const OperationalDashboard({Key? key}) : super(key: key);

  @override
  State<OperationalDashboard> createState() => _OperationalDashboardState();
}

class _OperationalDashboardState extends State<OperationalDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Operational Dashboard',
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
                    'SA',
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
      drawer: const DrawerWidget(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[200],
        child: SingleChildScrollView(
          child: Wrap(
            children: <Widget>[
              ButtonCard(
                title: 'SR Previous ',
                onTap: () {},
              ),
              ButtonCard(
                title: 'New SR ',
                onTap: () {},
              ),
              ButtonCard(
                title: 'SR Closed',
                onTap: () {},
              ),
              ButtonCard(
                title: 'Total SR',
                onTap: () {},
              ),
              ButtonCard(
                title: 'SR Beyond SLA',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
