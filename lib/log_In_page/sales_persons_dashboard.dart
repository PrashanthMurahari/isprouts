import 'package:flutter/material.dart';

class SalesPersonDashboard extends StatefulWidget {
  const SalesPersonDashboard({Key? key}) : super(key: key);
  @override
  State<SalesPersonDashboard> createState() => _SalesPersonDashboardState();
}
class _SalesPersonDashboardState extends State<SalesPersonDashboard> {
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
          children: [
            ElevatedButton(
              child: const Text('add'),
              onPressed: (){
                showModalBottomSheet(
                    enableDrag: false,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15.0),
                        )
                    ),
                    context: context,
                    builder: (context){
                      return Container(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: Column(
                          children: const [
                            Text('sales'),
                          ],
                        ),
                      );
                    }
                );
              },
            ),
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
