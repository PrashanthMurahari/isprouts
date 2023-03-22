import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: MyApp()
));
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body:
      Center(
        child:Column(
          children: <Widget> [
            Padding(padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
              child:Image.network('data:image/png;base64,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',
                width: 150.0,
                height:150.0 ,
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(200.0, 0.0, 200.0, 0.0),
              child:TextField(decoration: InputDecoration(labelText: 'Mobile Number'),
                style:TextStyle(
                  color: Colors.black,
                  fontSize:20.0 ,
                ) ,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(200.0, 0.0, 200.0, 0.0),
              child:TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'OTP'),
                style:TextStyle(
                  color: Colors.deepOrange,
                  fontSize:20.0 ,
                ) ,
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 30.0,),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/dashboard');
            },
                child:Text('Login')
            ),
            SizedBox(height: 10.0,),
            TextButton(onPressed: (){},
              child:Text('Resend OTP ?'),
            ),
          ],
        ),
      ),
    );
  }
}