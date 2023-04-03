import 'package:isprouts/Isprout_app/Super_Admins_page/button_page.dart';
import 'package:isprouts/Isprout_app/Super_Admins_page/drawer_page.dart';
import 'package:flutter/material.dart';
class DashBoard extends StatelessWidget {
  const DashBoard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title:  Padding(padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              const Text('Dashboard',style: TextStyle(color: Colors.black,fontSize:25,fontWeight: FontWeight.bold),),
              Row(
                children: const [
                   Icon(Icons.notifications_none,color: Colors.black,size: 14,),
                   SizedBox(width: 5,),
                   Icon(Icons.person,color: Colors.black,size: 14,),
                   SizedBox(width: 5,),
                  Text('SA',style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
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