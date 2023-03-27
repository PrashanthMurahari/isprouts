import 'package:flutter/material.dart';
void main() => runApp(const MaterialApp(
  home: MyHome(),
));

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}
class _MyHomeState extends State<MyHome> {
  final _namecontroller =TextEditingController();
  List<String> list_a =["prashanth","Sreekanth","vamshi"];
  List<String> list_b =["Prashanth","nope"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter'),
              controller: _namecontroller,
            ),
            ElevatedButton(
                onPressed: (){
                  if (list_a.contains(_namecontroller.text)){
                      print('Hi');
                  }
                  else if (list_b.contains(_namecontroller.text)){
                    print('hello');
                  }
                  else{
                    print('nope');
                  }
                },
                child: const Text('add'))
          ],
        ),
      ),
    );
  }
}
