import 'package:isprouts/Isprout_app/Super_Admins_page/button_page.dart';
import 'package:isprouts/Isprout_app/Super_Admins_page/drawer_page.dart';
import 'package:flutter/material.dart';
class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('dashboard'),
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey[200],
              child: Wrap(
                children: <Widget>[
                  ButtonCard(
                    title:'Area\n ' ,

                    onTap: () {
                    },
                  ),
                  ButtonCard(title: 'Location/Center\n ',
                    onTap: () {
                    },
                  ),
                  ButtonCard(
                    title: 'Workstations',
                    onTap: () {
                    },
                  ),
                  ButtonCard(
                    title: 'Potential Revenue',
                    onTap: () {
                    },
                  ),
                  ButtonCard(
                    title: 'Employees',
                    onTap: () {
                    },
                  ),
                  ButtonCard(
                    title: 'Revenue',
                    onTap: () {
                    },
                  ),
                  ButtonCard(
                    title: 'Expenses',
                    onTap: () {
                    },
                  ),
                  ButtonCard(
                    title: 'Occupancy',
                    onTap: () {
                    },
                  ),
                  ButtonCard(
                    title: 'Clients',
                    onTap: () {
                    },
                  ),
                  ButtonCard(
                    title: 'Happiness Index',
                    onTap: () {
                    },
                  ),
                  ButtonCard(
                    title: 'Service Request',
                    onTap: () {
                    },
                  ),
                  ButtonCard(
                    title: 'Conf.Bookings',
                    onTap: () {
                    },
                  ),
                  ButtonCard(
                    title: 'Leads',
                    onTap: () {
                    },
                  ),
                  ButtonCard(
                    title: 'Lead PipeLine',
                    onTap: () {
                    },
                  ),
                  ButtonCard(
                    title: 'Lead Closed',
                    onTap: () {
                    },
                  ),
                ],
              ),
            ),
      ),


    );
  }
}