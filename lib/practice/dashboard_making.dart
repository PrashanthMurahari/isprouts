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
      appBar:AppBar(
        title: const Text('Dashboard',
        style: TextStyle(
          color: Colors.black,
        ),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 20, 30),
              width: double.infinity,
              color: Colors.grey[200],
              child: Wrap(
                children: [

                  Container(
                    height: 100,
                    width: 50,
                    padding: EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: Text('Area',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                  Container(
                    height: 100,
                    width: 50,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Text('Area',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Text('Area',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Text('Area',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Text('Area'),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Text('Area'),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Text('Area'),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Text('Area'),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Text('Area'),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Text('Area'),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Text('Area'),
                  ),Container(
                    height: 100,
                    width: 100,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Text('Area'),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Text('Area',
                    textAlign: TextAlign.center,),
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}