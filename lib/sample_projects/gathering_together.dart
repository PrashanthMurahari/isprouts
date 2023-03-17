import 'package:flutter/material.dart';
import './elements_of_dashboard.dart';

void main() =>runApp(MaterialApp(
    home:DashBoard()
));
class DashBoard extends StatefulWidget {
  @override
  State<DashBoard> createState() => _DashBoardState();
}
class _DashBoardState extends State<DashBoard> {
  final List<Elements> elements=[
    Elements(
          area: 'Area',
          location_centers: 'Location Centers',
          workstations: 'Workstations',
          potential_revenue: 'Potential Revenue',
          employees: 'Employees',
          revenue: 'Revenue',
          expenses: 'Expenses',
          occupancy: 'Occupancy',
          clients: 'Clients',
          happiness_index: 'Happiness Index',
          service_requests: 'Service Requests',
          conf_bookings: 'Conf Bookings',
          leads: 'Leads',
          lead_pipeline: 'Lead Pipeline',
          lead_closed: 'Lead Closed',
          revenue_chart: 'Revenue Chart',
          occupancy_chart: 'Occupancy Chart',
          lead_closed_chart: 'Lead Closed Chart'
         )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),

      ),
      body:
      Column(
        children: <Widget> [
          TextButton(onPressed: (){
            var length_of_elements = elements.length;
            print(length_of_elements);
          },child: Text('add'),)
        ],
      )




    );



  }
}
