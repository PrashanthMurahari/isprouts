import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  home:MyApp()
));
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('hello'),
      ),
      body:Center(
      child:Column(

        children: <Widget> [

          ElevatedButton(onPressed: (){
            showgestures(context);
          }, child: Text('Don\'t touch'))
        ],
      ),
      ),
    );
  }
}

void showgestures(BuildContext context){
  showDialog(context: context, builder:
      (BuildContext context){
    return AlertDialog(
      title: Text('Error!!!',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
          color: Colors.black,
        ),
      ),
      content:Text('Please enter valid number.....'),
      actions: <Widget>[
        TextButton(onPressed: (){
          Navigator.pop(context,false);
        },
          child: Text('Close..',
            style: TextStyle(
              color: Colors.green,
              fontSize: 16.0,

            ),
          ),

        )
      ],
    );
  });
}