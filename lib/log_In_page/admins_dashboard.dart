import 'package:flutter/material.dart';

class AdminsDashboard extends StatefulWidget {
  final String adminNumber;
  const AdminsDashboard(this.adminNumber, {super.key});
  @override
  State<AdminsDashboard> createState() => _AdminsDashboardState();
}
class _AdminsDashboardState extends State<AdminsDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  // ignore: non_constant_identifier_names
  _AdminsDashboardState();
  Map<String,String> namesOfAdmins = {
    '9573977890': "Prashanth",
    '9381419853': "Prashanth2",
  };
  String? adminName;
  @override
  void initState() {
    super.initState();
    findingName();
  }
  void findingName() {
    for (var i in namesOfAdmins.keys) {
      if (i == widget.adminNumber) {
        adminName = namesOfAdmins[i]!;
        break;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.deepOrangeAccent,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        backgroundColor: Colors.grey[100],
        title: Text(
          adminName ?? "",
          style:const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('add'),
              onPressed: () {
                showModalBottomSheet(
                    enableDrag: false,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15.0),
                    )),
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: Column(
                          children: const [
                            Text('Add what you need'),
                          ],
                        ),
                      );
                    });
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